/*
 *  clfsm_main.cc
 *  clfsm
 *
 *  Created by Rene Hexel on 12/10/12.
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
#include <iostream>
#include <sstream>
#include <unistd.h>

#include "gu_util.h"
#include "FSMWBSubMachine.h"
#include "FSMachineVector.h"
#include "clfsm_machine.h"
#include "clfsm_wb_vector_factory.h"

using namespace std;
using namespace FSM;

static CLFSMWBVectorFactory *createMachines(vector<MachineWrapper *> &machineWrappers, const vector<string> &machines, const vector<string> &compiler_args, const vector<string> &linker_args)
{
        CLFSMWBVectorFactory *factory = new CLFSMWBVectorFactory();
        int i = 0;
        for (vector<string>::const_iterator it = machines.begin(); it != machines.end(); it++)
        {
                const string &machine = *it;
                machineWrappers.push_back(new MachineWrapper(machine));
                MachineWrapper &machineWrapper = *machineWrappers[i];
                machineWrapper.setCompilerArgs(compiler_args);
                machineWrapper.setLinkerArgs(linker_args);
                CLMachine *clm = machineWrapper.instantiate(i, machine.c_str());
                if (clm) factory->addMachine(clm);
                else cerr << "Could not add machine " << i << ": '" << machine << "'" << endl;
                i++;
        }

        return factory;
}


static void usage(const char *cmd)
{
        cerr << "Usage: " << cmd << "[-c]{-I includedir}{-L linkdir}{-l lib}" << endl;
}


int main(int argc, char * const argv[])
{
        vector<MachineWrapper *> machineWrappers;
        vector<string> machines;
        vector<string> compiler_args;
        vector<string> linker_args;

        compiler_args.push_back("-std=c++11");    /// XXX: fix this

        int ch;
        bool cflag = false;
        while ((ch = getopt(argc, argv, "gcI:L:l:")) != -1)
        {
                switch (ch)
                {
                        case 'c':
                                cflag = true;
                                break;
                        case 'g':
                                compiler_args.push_back("-g");
                                linker_args.push_back("-g");
                                break;
                        case 'I':
                                compiler_args.push_back("-I");
                                compiler_args.push_back(optarg);
                                break;
                        case 'L':
                                linker_args.push_back("-L");
                                linker_args.push_back(optarg);
                                break;
                        case 'l':
                                linker_args.push_back("-l");
                                linker_args.push_back(optarg);
                                break;
                        case '?':
                        default:
                                usage(argv[0]);
                                exit(EXIT_FAILURE);
                }
        }
        argc -= optind;
        argv += optind;

        while (argc--) machines.push_back(*argv++);

        if (!compiler_args.size()) compiler_args = MachineWrapper::default_compiler_args();
        if (!linker_args.size())   linker_args   = MachineWrapper::default_linker_args();

        CLFSMVectorFactory *factory = createMachines(machineWrappers, machines, compiler_args, linker_args);
        factory->fsms()->execute();
        delete factory;

        for (vector<MachineWrapper *>::const_iterator it = machineWrappers.begin(); it != machineWrappers.end(); it++)
                if (*it) delete *it;

        return EXIT_SUCCESS;
}
