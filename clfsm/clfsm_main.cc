/*
 *  clfsm_main.cc
 *  clfsm
 *
 *  Created by Rene Hexel on 12/10/12.
 *  Copyright (c) 2012, 2013, 2014, 2015, 2018 Rene Hexel. All rights reserved.
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
#pragma clang diagnostic ignored "-Wreserved-id-macro"
#pragma clang diagnostic ignored "-Wunused-macros"
#pragma clang diagnostic ignored "-Wold-style-cast"
#pragma clang diagnostic ignored "-Wdeprecated"
#pragma clang diagnostic ignored "-W#warnings"
#pragma clang diagnostic ignored "-Wc++98-compat"
#pragma clang diagnostic ignored "-Wcast-qual"

#ifndef _BSD_SOURCE
#define _BSD_SOURCE 199601
#endif

#include <iostream>
#include <sstream>
#include <cstdio>
#include <cerrno>
#include <cctype>

//#include <stdio.h>
#ifdef __block
//#define block_defined
#undef __block
#endif

#include <stdlib.h>                     // C++ stdlib instead of cstdlib.
#include <unistd.h>
#include <signal.h>
#ifndef WITHOUT_BACKTRACE
#include <execinfo.h>
#endif
#include <libgen.h>
#include <sys/stat.h>
#include <memory>

//#ifdef block_defined
//#define __block __attribute__((__blocks__(byref)))
//#endif

#include "gu_util.h"
#include "FSMState.h"
#include "FSMSuspensibleMachine.h"
#include "FSMAsynchronousSuspensibleMachine.h"
#include "FSMachineVector.h"
#include "CLMachine.h"
#include "clfsm_machine.h"
#include "clfsm_wb_vector_factory.h"
#include "gugenericwhiteboardobject.h"
#include "clfsm_machine_loader.h"

// Visitors and Support Objects
#include "clfsm_visitors.h"
#include "clfsm_visitorsupport.h"

// Reflection API
#include <CLReflect/CLReflectAPI.h>

//Time-Triggered Includes
#include "FileParser.h"
#include "TTCLFSMVectorFactory.h"
#include <unistd.h>
#include "Schedule.h"

static const char *command;
static int command_argc;
static char * const *command_argv;
static bool nonstop;
static bool time_state_execution;
static FILE* fStateMsgOutput;
static int verbosity;

using namespace std;
using namespace FSM;

struct clfsm_context {
    CLFSMMachineLoader* loader;
};

static CLFSMWBVectorFactory *createMachines(const vector<string> &machines, const vector<string> &compiler_args, const vector<string> &linker_args)
{
    CLFSMMachineLoader *loader = CLFSMMachineLoader::getMachineLoaderSingleton();
    for (vector<string>::const_iterator it = machines.begin(); it != machines.end(); it++)
    {
            const string &machine = *it;
            FSM::loadAndAddMachineAtPath(machine, false, compiler_args, linker_args);
    }
    return static_cast<CLFSMWBVectorFactory*>(loader->vector_factory());
}

static void __attribute((noreturn)) aborting_signal_handler(int signum)
{
#ifdef DEBUG
    guWhiteboard::QSay_t say;
#else
    guWhiteboard::QSpeech_t say;
#endif
    stringstream ss;

    if (signum == SIGTERM || signum == SIGQUIT || signum == SIGINT)
        nonstop = false;

    ss << "Caught signal " << signum << ": " << (nonstop ? "restarting ... " : "aborting ...") << endl;

    say(ss.str());
    cerr << ss.str();

    if (time_state_execution)
    {
        CLFSMVisitorsExecution::print_results_stderr();
    }

    abort();
}


#ifndef WITHOUT_BACKTRACE
static void print_backtrace(int signum)
{
    void *callstack[256];
    int olderrno = errno;
    int frames = backtrace(callstack, sizeof(callstack)/sizeof(callstack[0]));
    char **strs = backtrace_symbols(callstack, frames);
    char tmpname[256];
    snprintf(tmpname, sizeof(tmpname), "/tmp/%s-XXXX", basename((char *)command));
    int fn = mkstemp(tmpname);
    FILE *logfile = fdopen(fn, "w");
    if (!logfile)
    {
        fprintf(stderr, "*** Cannot open '%s': %s", tmpname, strerror(errno));
    }

#ifdef DEBUG
    guWhiteboard::QSay_t say;
#else
    guWhiteboard::QSpeech_t say;
#endif
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
    errno = olderrno;
}
#endif

static void __attribute((noreturn)) backtrace_signal_handler(int signum)
{
#ifdef WITHOUT_BACKTRACE
    (void) signum;
#else
    print_backtrace(signum);
#endif
    signal(SIGABRT, SIG_DFL);
    if (nonstop)
    {
        cerr << "Starting \"";
        for (int i = 0; i < command_argc; i++)
            cerr << " " << command_argv[i];
        cerr << "\"" <<	 endl;
        execvp(command, command_argv);
        fprintf(stderr, "*** Cannot re-run '%s': %s", command, strerror(errno));
    }

    abort();
}


static void usage(const char *cmd)
{
    cerr << "Usage: " << cmd << "[-c][-d][-fPIC]{-I includedir}[-i idlesleep]{-L linkdir}{-l lib}[-n][-P <machine>][-s][-S <machine>][-t][-v][-T]" << endl;
    cerr << "[-c] = Compile only flag, don't execute machine." << endl;
    cerr << "[-f] = compiler specific flags (eg. 'PIC' To generate Position Independent Code)." << endl;
    cerr << "{-I idlesleep} = Number of microseconds to sleep when idle (default: 10000)" << endl;
    cerr << "{-i includedir} = Directory to include during compilation. Use repeatedly for multiple directories." << endl;
    cerr << "{-L linkdir} = Directory to include during linking. Use repeatedly for multiple directories." << endl;
    cerr << "{-l lib} = Library to include during linking. Use repeatedly for multiple libraries." << endl;
    cerr << "[-n] = Restart CLFSM after SIGABRT or SIGIOT signals." << endl;
    cerr << "[-P <machine>] = Preload a machine." << endl;
    cerr << "[-s] = Outputs information about machine suspensions and resumes." << endl;
    cerr << "[-S <machine>] = Load a machine suspended." << endl;
    cerr << "[-t] = Time execution of machine states." << endl;
    cerr << "[-v] = Verbose; output MachineID, State, and name of machine. (multiple times to increase verbosity)" << endl;
    cerr << "[-d] = Output debug information (requires Verbose switch)." << endl;
    cerr << "[-T] = Time-Triggered execution of machine states" << endl;
}

static bool debug_internal_states = false;

static bool print_machine_and_state(void *ctx, SuspensibleMachine *machine, int machine_number)
{
        struct clfsm_context *context = static_cast<struct clfsm_context *>(ctx);
        MachineWrapper* wrapper = context->loader->machineWrappers().at(machine_number);
        const char *machineName = wrapper->name();
        const char* path = wrapper->path();

        if (machine->previousState() != machine->currentState())
        {
            if (verbosity > 1)
                fprintf(fStateMsgOutput, "%sm%3d s%3d - %-30.30s / %-20.20s - %s\n",  debug_internal_states ? "\n" : "", machine_number, machine->indexOfState(), path, machineName, machine->currentState()->name().c_str());
            else
                fprintf(fStateMsgOutput, "%sm%3d s%3d - %-20.20s - %s\n",  debug_internal_states ? "\n" : "", machine_number, machine->indexOfState(), machineName, machine->currentState()->name().c_str());
        }
        else if (debug_internal_states)
                fprintf(fStateMsgOutput, "%d/%d ", machine_number, machine->indexOfState());

        return true;
}


static bool unloadMachineIfAccepting(void *ctx, SuspensibleMachine *machine, int machine_number)
{
        if (machine->isSuspended()) return false;   // don't unload if suspended

        struct clfsm_context *context = static_cast<struct clfsm_context *>(ctx);
        if (machine->scheduledForSuspend() ||       // don't unload if scheduled for suspend
            machine->scheduledForRestart())         // don't unload if scheduled for restart
        {
#ifndef NDEBUG
            const char *action = machine->scheduledForRestart() ? "restart" : "suspension";
            MachineWrapper* wrapper = context->loader->machineWrappers().at(machine_number);
            const char *machineName = wrapper ? wrapper->name() : NULLPTR;
            if (!machineName) machineName = "<unknown>";
            cerr << "*** Machine " << machine->id() << ": '" << machineName << "' scheduled for " << action << " -- not unloading! ***" << endl;
#endif
            return false;
        }

        CLFSMMachineLoader *loader = context->loader;
        loader->unloadMachineAtIndex(machine_number);

        return true;
}

bool isTT = false;

int main(int argc, char * const argv[])
{
    fStateMsgOutput = stderr;

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
#ifdef SIGINFO
    signal(SIGINFO, print_backtrace);
#endif
#ifndef WITHOUT_BACKTRACE
    signal(SIGTSTP, print_backtrace);
    signal(SIGHUP,  print_backtrace);
#endif

    compiler_args.push_back("-std=c++11");    /// XXX: fix this

    int ch;
    int debug = 0, verbose = 0, noUnloadIfAccepting = 0;
    std::vector<std::string> preloads;
    std::vector<std::string> suspends;
    while ((ch = getopt(argc, argv, "dgf:I:i:L:l:nstuvTP:S:")) != -1)
    {
        switch (ch)
        {
            case 'd':
                debug++;
                break;
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
            case 'i':
                FSM::CLFSMMachineLoader::idle_timeout = atol(optarg);
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
                DBG(cerr << "nonstop mode: sleeping 1 second before (re)starting" << endl);
                protected_usleep(1000000ULL);
                break;
            case 'P':
            {
                if (optarg == NULLPTR)
                {
                    std::cerr << "You must provide a path to a machine when using -P." << std::endl;
                    return EXIT_FAILURE;
                }
                const std::string path = std::string(optarg);
                preloads.push_back(path);
                break;
            }
            case 'S':
            {
                if (optarg == NULLPTR)
                {
                    std::cerr << "You must provide a path to a machine when using -S." << std::endl;
                    return EXIT_FAILURE;
                }
                const std::string path = std::string(optarg);
                suspends.push_back(path);
                break;
            }
            case 's':
                FSM::debugSuspends++;
                break;
            case 't': // Timer Flag
                time_state_execution = true;
                break;
            case 'T': // Time-Triggered Execution
                isTT = true;
                break;
            case 'v':
                verbose++;
                break;
            case 'u':
                noUnloadIfAccepting++;
                break;
            case '?':
            default:
                usage(argv[0]);
                exit(EXIT_FAILURE);
        }
    }

    argc -= optind;
    argv += optind;
    Schedule *schedule = nullptr;

    if (isTT) {
        string tablePath(*argv);
        FileParser* parser = new FileParser(tablePath);
        schedule = parser->createSchedule();
        machines = schedule->paths();
        delete(parser);
    } else{
        while (argc--)
        {
            struct stat s;
            string machine(*argv++);
            if (stat(machine.c_str(), &s) < 0)
            {
                string machine_with_extension = machine + ".machine";
                if (stat(machine_with_extension.c_str(), &s) < 0)
                {
                    perror(machine.c_str());
                    continue;
                }
                machine = machine_with_extension;
            }
            machines.push_back(machine);
        }
    }

    if (!compiler_args.size()) compiler_args = MachineWrapper::default_compiler_args();
    if (!linker_args.size())   linker_args   = MachineWrapper::default_linker_args();

    visitor_f visitor = NULLPTR;
    visitor_f accept_action = NULLPTR; //Used to unload machines when in accepting state
    if ((verbosity = verbose)) visitor = print_machine_and_state;
    if (time_state_execution) visitor = CLFSMVisitorsExecution::time_state_execution;
    if (!noUnloadIfAccepting) accept_action = unloadMachineIfAccepting;
#ifdef WANT_FSM_REFLECTION
    refl_initAPI(NULLPTR); //Init reflection system
#endif
    CLFSMWBVectorFactory *factory = createMachines(machines, compiler_args, linker_args);
    struct clfsm_context context = { CLFSMMachineLoader::getMachineLoaderSingleton() };
    factory->postMachineStatus();
    debug_internal_states = debug;
    for (std::string path : preloads)
    {
        if (!FSM::preloadMachineAtPath(path)) return EXIT_FAILURE;
    }
    for (std::string path : suspends)
    {
        if (FSM::loadAndAddMachineAtPath(path, true) < 0) return EXIT_FAILURE;
    }
    if (!isTT) {
        factory->fsms()->execute(visitor, &context, accept_action);
    } else {
        TTCLFSMVectorFactory* ttFactory = static_cast<TTCLFSMVectorFactory*>(factory);
        ttFactory->executeTT(visitor, schedule, &context, accept_action);
    }
#ifdef WANT_FSM_REFLECTION
    refl_destroyAPI(NULLPTR); // Destroy reflection system
#endif
    // Print Execution Results
    if (time_state_execution)
    {
        CLFSMVisitorsExecution::print_results_stderr();
    }

    delete CLFSMMachineLoader::getMachineLoaderSingleton();
    delete(schedule);

    return EXIT_SUCCESS;
}
