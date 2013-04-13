/*
 *  clfsm_main.cc
 *  clfsm
 *
 *  Created by Rene Hexel on 12/10/12.
 *  Copyright (c) 2012, 2013 Rene Hexel. All rights reserved.
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
#include <cstdlib>
#include <cstdio>
#include <cerrno>
#include <unistd.h>
#include <signal.h>
#include <execinfo.h>
#include <libgen.h>

#include "gu_util.h"
#include "FSMSuspensibleMachine.h"
#include "FSMachineVector.h"
#include "clfsm_machine.h"
#include "clfsm_wb_vector_factory.h"
#include "gugenericwhiteboardobject.h"

static const char *command;
static int command_argc;
static char * const *command_argv;
static bool nonstop;

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


static void __attribute((noreturn)) aborting_signal_handler(int signum)
{
        guWhiteboard::QSay_t say;
        stringstream ss;

        if (signum == SIGTERM || signum == SIGQUIT || signum == SIGINT)
                nonstop = false;

        ss << "Caught signal " << signum << ": " << (nonstop ? "restarting ... " : "aborting ...") << endl;

        say(ss.str());
        cerr << ss.str();

        abort();
}


static void print_backtrace(int signum)
{
        void *callstack[256];
        int frames = backtrace(callstack, sizeof(callstack)/sizeof(callstack[0]));
        char **strs = backtrace_symbols(callstack, frames);
        char tmpname[256];
        snprintf(tmpname, sizeof(tmpname), "/tmp/%s-XXX.log", basename((char *)command));
        int fn = mkstemps(tmpname, 4);
        FILE *logfile = fdopen(fn, "w");
        if (!logfile)
                fprintf(stderr, "*** Cannot open '%s': %s", tmpname, strerror(errno));
        guWhiteboard::QSay_t say;
        for (int i = 0; i < frames; ++i)
        {
                char *function = strs[i];
                char *state = strstr(function, "State");
                if (state) say(state);
                if (logfile) fprintf(logfile,"%3.3d: %s\n", i, function);
                fprintf(stderr, "%3.3d: %s\n", i, function);
        }
        free(strs);
        if (logfile)
        {
                fclose(logfile);
                fprintf(stderr, "Log file written to '%s'\n", tmpname);
        }
        if (signum == SIGTSTP) kill(getpid(), SIGSTOP);
}


static void __attribute((noreturn)) backtrace_signal_handler(int signum)
{
        print_backtrace(signum);
        signal(SIGABRT, SIG_DFL);
        if (nonstop)
        {
                guWhiteboard::QSay_t say;
                stringstream ss;
                ss << "Starting ";
                for (int i = 0; i < command_argc; i++)
                        ss << command_argv[i];
                say(ss.str());
                execvp(command, command_argv);
                fprintf(stderr, "*** Cannot re-run '%s': %s", command, strerror(errno));
        }
        abort();
}


static void usage(const char *cmd)
{
        cerr << "Usage: " << cmd << "[-c][-fPIC]{-I includedir}{-L linkdir}{-l lib}[-n]" << endl;
}


int main(int argc, char * const argv[])
{
        vector<MachineWrapper *> machineWrappers;
        vector<string> machines;
        vector<string> compiler_args;
        vector<string> linker_args;

        command_argc = argc;
        command_argv = argv;
        command = argv[0];

        signal(SIGABRT, backtrace_signal_handler);
        signal(SIGIOT,  backtrace_signal_handler);

        signal(SIGINT,  aborting_signal_handler);
        signal(SIGTERM, aborting_signal_handler);
        signal(SIGQUIT, aborting_signal_handler);
        signal(SIGSEGV, aborting_signal_handler);
        signal(SIGBUS,  aborting_signal_handler);
        signal(SIGILL,  aborting_signal_handler);
        signal(SIGSYS,  aborting_signal_handler);
        signal(SIGFPE,  aborting_signal_handler);
        signal(SIGXCPU, aborting_signal_handler);

        signal(SIGINFO, print_backtrace);
        signal(SIGTSTP, print_backtrace);
        signal(SIGHUP,  print_backtrace);

        compiler_args.push_back("-std=c++11");    /// XXX: fix this

        int ch;
        //bool cflag = false;
        while ((ch = getopt(argc, argv, "gf:I:L:l:n")) != -1)
        {
                switch (ch)
                {
                                //case 'c':
                                //cflag = true;
                                //break;
                        case 'g':
                                compiler_args.push_back("-g");
                                linker_args.push_back("-g");
                                break;
                        case 'f':
                                compiler_args.push_back(string("-f")+optarg);
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
                        case 'n':
                                nonstop = true;
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

        CLFSMWBVectorFactory *factory = createMachines(machineWrappers, machines, compiler_args, linker_args);
        factory->postMachineStatus();
        factory->fsms()->execute();
        delete factory;

        for (vector<MachineWrapper *>::const_iterator it = machineWrappers.begin(); it != machineWrappers.end(); it++)
                if (*it) delete *it;

        return EXIT_SUCCESS;
}
