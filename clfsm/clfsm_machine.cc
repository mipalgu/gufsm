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
#include <sys/utsname.h>
#include "clfsm_cc.h"
#include "clfsm_machine.h"

using namespace std;
using namespace FSM;

MachineWrapper::MachineWrapper(string path): _fullPath(path), _compiler(nullptr), _delete_compiler(false)
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

        filename << binaryDirectory() << "/States";

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


bool MachineWrapper::compile(const vector<string> &args)
{
        string binary_directory = binaryDirectory();

        if (!compiler()) setCompiler();

        mkdir(binary_directory.c_str(), 0777);

        vector<string> files = states();
        files.push_back("");

        __block bool success = true;
        dispatch_apply(files.size(), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t i)
        {
                vector<string> compiler_args = args;
                stringstream file;
                stringstream outfile;

                if (files[i].length())
                        file << "State_" << files[i];
                else
                        file << name();

                outfile << binary_directory << "/" << file.str() << ".so";
                file << ".mm";

                compiler_args.push_back("-I");
                compiler_args.push_back(path());
                compiler_args.push_back("-c");
                compiler_args.push_back("-o");
                compiler_args.push_back(outfile.str());
                compiler_args.push_back(file.str());

                if (!compiler()->compile(compiler_args))
                        success = false;
        });

        return success;
}
