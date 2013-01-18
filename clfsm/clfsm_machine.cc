/*
 *  clfsm_machine.cc
 *  clfsm
 *
 *  Created by Rene Hexel on 11/10/12.
 *  Copyright (c) 2012 Rene Hexel. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials
 *    provided with the distribution.
 *
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgement:
 *
 *        This product includes software developed by Rene Hexel.
 *
 * 4. Neither the name of the author nor the names of contributors
 *    may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * -----------------------------------------------------------------------
 * This program is free software; you can redistribute it and/or
 * modify it under the above terms or under the terms of the GNU
 * General Public License as published by the Free Software Foundation;
 * either version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/licenses/
 * or write to the Free Software Foundation, Inc., 51 Franklin Street,
 * Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */
#include <sstream>
#include <fstream>
#include <dispatch/dispatch.h>
#include <libgen.h>
#include <dlfcn.h>
#include <sys/utsname.h>
#include <sys/stat.h>
#include <gu_util.h>
#include "clfsm_cc.h"
#include "clfsm_machine.h"

using namespace std;
using namespace FSM;

static dispatch_queue_t sync_queue = nullptr;

MachineWrapper::MachineWrapper(string path): _fullPath(path), _factory(nullptr), _shared_object(nullptr), _compiler(nullptr), _compiler_args(nullptr), _linker_args(nullptr), _delete_compiler(false)
{
        char pathName[path.length()];

        strcpy(pathName, path.c_str());
        char *base = basename(pathName);
        char *dot = strchr(base, '.');
        if (dot) *dot = '\0';

        _name = base;
}


MachineWrapper::~MachineWrapper()
{
        if (_shared_object) dlclose(_shared_object);
        if (_delete_compiler) delete _compiler;
}


void MachineWrapper::setCompiler(Cc *compiler, bool del)
{
        if (!compiler)
        {
                compiler = new Cc();
                del = true;
        }
        _compiler = compiler;
        _delete_compiler = del;
}


string MachineWrapper::binaryDirectory() const
{
        struct utsname buffer;
        stringstream ss;

        ss << _fullPath << "/";

        if (uname(&buffer) == -1)
                ss << "unknown-architecture";
        else
                ss << buffer.sysname << "-" << buffer.machine;

        return ss.str();
}


vector<string> MachineWrapper::states() const
{
        stringstream filename;

        filename << path() << "/States";

        DBG(cout << filename.str() << endl);
        ifstream file(filename.str());
        vector<string> states;

        while (!file.eof())
        {
                string name;
                getline(file, name);
                if (file.fail())
                        break;
                if (name.length())
                        states.push_back(name);
        }

        return states;
}


bool MachineWrapper::compile(const vector<string> &compiler_args, const vector<string> &linker_args)
{
        string binary_directory = binaryDirectory();
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken,
        ^{
                sync_queue = dispatch_queue_create("net.mipal.clfsm.compile", DISPATCH_QUEUE_SERIAL);
        });
        if (!compiler()) setCompiler();

        mkdir(binary_directory.c_str(), 0777);

        vector<string> files = states();
        files.push_back("");

        __block vector<string> outfiles;
        __block bool success = true;
        dispatch_apply(files.size(), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t i)
        {
                vector<string> args = compiler_args;
                stringstream file;
                stringstream outfile;

                if (files[i].length())
                        file << "State_" << files[i];
                else
                        file << name();

                outfile << binary_directory << "/" << file.str() << ".o";
                file << ".mm";

                string outfilename = outfile.str();

                args.push_back("-I");
                args.push_back(path());
                args.push_back("-Weverything");
                args.push_back("-Wno-weak-vtables");
                args.push_back("-Wno-padded");
                args.push_back("-stdlib=libc++");
                args.push_back("-c");
                args.push_back("-o");
                args.push_back(outfilename);
                args.push_back(_fullPath + "/" + file.str());

                if (!compiler()->compile(args))
                        success = false;
                else dispatch_sync(sync_queue,
                ^{
                        outfiles.push_back(outfilename);
                });
        });
        if (success)    // link into shared object if compiler was successful
        {
                vector<string> args = linker_args;
                for (const string &outfile: outfiles)
                        args.push_back(outfile);
                args.push_back("-shared");
                args.push_back("-stdlib=libc++");
                //args.push_back("-lclfsm");
                args.push_back("-o");
                args.push_back(binary_directory + "/" + name() + ".so");

                success = compiler()->compile(args);
        }

        return success;
}


CLMachine *MachineWrapper::instantiate(int id, const char *machine_name)
{
        if (!_shared_object)
        {
                string shared_path = binaryDirectory() + "/" + _name + ".so";
                if (!(_shared_object = dlopen(shared_path.c_str(), RTLD_NOW|RTLD_GLOBAL)))
                {
                        const vector<string> *compiler_args = _compiler_args;
                        const vector<string> *linker_args = _linker_args;

                        if (!compiler_args) compiler_args = &default_compiler_args();
                        if (!linker_args)   linker_args   = &default_linker_args();

                        compile(*compiler_args, *linker_args);

                        if (!(_shared_object = dlopen(shared_path.c_str(), RTLD_NOW|RTLD_GLOBAL)))
                                return nullptr;
                }
        }
        if (!_factory)
        {
                string symbol = string("CLM_Create_") + name();
                _factory = create_machine_f(dlsym(_shared_object, symbol.c_str()));
                if (!_factory)
                {
                        symbol = string("_CLM_Create_") + name();
                        if (!(_factory = create_machine_f(dlsym(_shared_object, symbol.c_str()))))
                                return nullptr;
                }
        }
        return _factory(id, machine_name);
}


const vector<string> &MachineWrapper::default_compiler_args()
{
        static vector<string> args;

        if (!args.size())
        {
                args.push_back("-I/usr/local/include/clfsm");
                args.push_back("-I/usr/local/include");
        }
        return args;
}


const vector<string> &MachineWrapper::default_linker_args()
{
        static vector<string> args;

        if (!args.size())
        {
                args.push_back("-L/usr/local/lib");
                args.push_back("-rpath");
                args.push_back("/usr/local/lib");
        }
        return args;
}
