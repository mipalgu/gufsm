/*
 *  FSMachineVector.cc
 *  
 *  Created by René Hexel on 22/11/11.
 *  Copyright (c) 2011 Rene Hexel.
 *  All rights reserved.
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
#include "FSMANTLRMaths.h"
#include "FSMANTLRContext.h"

#include <iostream>
#include <sstream>
#include <unistd.h>
#include <gu_util.h>

#include "cdlbridge.h"

#include "FSMState.h"
#include "FSMExpression.h"
#include "FSMWBPostAction.h"
#include "FSMVectorFactory.h"
#include "FSMVectorRunner.h"

#define ANTLRFunc(x,n)  x func ## x; \
                        antlr_context.set_function((n), &func ## x);
#define ANTLRMaths(x)   ANTLRMaths ## x func ## x; \
                        antlr_context.set_function(func ## x.name(), &func ## x);

using namespace std;
using namespace FSM;

int dump_kripke(StateMachineVectorFactory &factory, vector<string> &machine_names);
int dumpNames(ANTLRContext & context);
int block_schedule(StateMachineVectorFactory &factory, vector<string> &machine_names);
int factory_execute(StateMachineVectorFactory &factory, vector<string> &machine_names);

static cdlbridge *gucdlbridge;

static void usage(const char *cmd)
{
        cerr << "Usage: " << cmd << " [-b][-k][-v][-n] [fsm [...]]" << endl;
        exit(EXIT_FAILURE);
}


int dump_kripke(StateMachineVectorFactory &factory, vector<string> &machine_names)
{
        string kripke = factory.fsms()->kripkeInSVMformat();
        cout << kripke << endl;
        return EXIT_SUCCESS;
}


int block_schedule(StateMachineVectorFactory &factory, vector<string> &machine_names)
{
        factory.fsms()->scheduleExecuteOnQueue();
        
        dispatch_main();                        // never returns

        return EXIT_FAILURE;
}


int factory_execute(StateMachineVectorFactory &factory, vector<string> &machine_names)
{
        factory.execute();                      // execute synchronously
        
        return EXIT_SUCCESS;
}

int dumpNames(ANTLRContext & context) 
{
	map<string, int> names = context.variables();
	map<string, int>::iterator it;
	
	for (it = names.begin(); it != names.end(); it++) {	
		printf("%s\n", (*it).first.c_str());
	}
	
	return EXIT_SUCCESS;
}

static StateMachineVectorFactory *exit_factory; // exit handler only
static void exit_handler(void)
{
        exit_factory->fsms()->suspend();
        exit_factory->fsms()->executeOnce();
}

static void signal_handler(int)
{
        exit_factory->fsms()->scheduleSuspend();
}

int main (int argc, char * const argv[])
{
        bool kripke_flag = false, verbose = false, dump_names = false, want_cdl = true,
#ifdef __APPLE__
        blocks_flag = true;
#else
        blocks_flag = false;
#endif
        int ch;
        while ((ch = getopt(argc, argv, "BbCkvn")) != -1)
        {
                switch (ch)
                {
                        case 'B':       // don't use blocks (dispatch queues)
                                blocks_flag = false;
                                break;
                        case 'b':       // use blocks (dispatch queues)
                                blocks_flag = true;
                                break;
                        case 'C':       // disable CDL bridge
                                want_cdl = false;
                                break;
                        case 'k':
                                kripke_flag = true;
                                break;
                        case 'v':
                                verbose = true;
                                break;
			case 'n': // dump variable names and scopes
				dump_names = true;
				break;
                        case '?':
                        default:
                                usage(argv[0]);
                }
        }
        argc -= optind;
        argv += optind;

        vector<string> machine_names;

        while (argc-- > 0)
                machine_names.push_back(*argv++);

        ANTLRContext antlr_context;
        StateMachineVectorFactory factory(&antlr_context, machine_names);
	exit_factory = &factory;

	/* Print the names then exit if that was requested. */
	if (dump_names) {
		return dumpNames(antlr_context);
	}
#if 1
        signal(SIGINT,  signal_handler);
        signal(SIGTERM, signal_handler);
        signal(SIGQUIT, signal_handler);
        signal(SIGSTOP, signal_handler);
        signal(SIGSTOP, signal_handler);
#else
#ifdef __APPLE__
        atexit_b(
        ^{
                factoryp->fsms()->suspend();
                if (blocks_flag)
                        protected_sleep(1);     // should create group and wait
                else
                        factoryp->fsms()->executeOnce();
        });
#else
        exit_factory = &factory;
        atexit(exit_handler);
#endif
#endif // 0
        if (kripke_flag)
        {
                return run_machine_vector(factory, machine_names, dump_kripke, verbose);
        }
        if (blocks_flag)                        // execute on dispatch queue
        {
                return run_machine_vector(factory, machine_names, block_schedule, verbose);
        }

        return run_machine_vector(factory, machine_names, factory_execute, verbose);
}

