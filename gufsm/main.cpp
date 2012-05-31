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
int block_schedule(StateMachineVectorFactory &factory, vector<string> &machine_names);
int factory_execute(StateMachineVectorFactory &factory, vector<string> &machine_names);

static cdlbridge *gucdlbridge;

/*
 * System functions
 */
struct StringFunction: public ContentAction<string>
{
        virtual void performv(Machine *m, ActionStage, int, va_list)
        {
                evaluate(m);
        }
        /** setting any parameter sets the content */
        virtual void add_parameter(int index, long long value)
        {
                setContent((const char *)value);
        }
};


#ifdef NEED_SLEEP
struct SleepFunction: public TimeoutPredicate
{
        virtual int evaluate(Machine *m = NULL)
        {
                protected_usleep(1000000LL * timeout());
                return 0;
        }
};
#endif

struct PrintStatenameFunction: public PrintingAction<string>
{
        PrintStatenameFunction(): PrintingAction<string>("") {}
        virtual int evaluate(Machine *m = NULL)
        {
                stringstream ss;
                ss << "Machine " << m->id() << " state " << m->currentState()->name();
                setContent(ss.str());
                perform(m);
                return 0;
        }
};

struct SystemFunction: public ContentAction<string>
{
        virtual void performv(Machine *m, ActionStage, int, va_list)
        {
                evaluate(m);
        }
        virtual int evaluate(Machine *m = NULL)
        {
                return system(_content.c_str());
        }
        /** setting any parameter sets the content */
        virtual void add_parameter(int index, long long value)
        {
                setContent((const char *)value);
        }
};

/*
 * Whiteboard functions
 */
typedef WBPostAction<const char *> PostStringFunction;
typedef WBPostAction<int> PostIntFunction;
typedef WBPostAction<bool> PostBoolFunction;

class WBPostIntVecAction: public WBPostAction<std::vector<int> >
{
public:
        /** default constructor */
        WBPostIntVecAction(): WBPostAction<std::vector<int> >() {}
        
        /** set parameters (clears vector on first element) */
        virtual void add_parameter(int index, long long value)
        {
                if (index--)
                {
                        if (!index) _content.clear();
                        if (index >= _content.size())
                                _content.push_back(value);
                        else
                                _content[index] = value;
                }
                else _type = (const char *) value;
        }
        
};

class WBSuspendFunction: public PostBoolFunction
{
public:
        WBSuspendFunction(std::string name = "suspend"): PostBoolFunction(name, false) {}

        virtual void add_parameter(int index, long long value)
        {
                _type = string("suspend_") + (const char *) value;
                PostBoolFunction::add_parameter(1, true);
        }
};


class WBResumeFunction: public WBSuspendFunction
{
public:
        WBResumeFunction(): WBSuspendFunction("resume") {}

        virtual void add_parameter(int index, long long value)
        {
                _type = string("suspend_") + (const char *) value;
                PostBoolFunction::add_parameter(1, false);
        }
};


class WBRestartFunction: public PostStringFunction
{
public:
        WBRestartFunction(std::string name = "restart"): PostStringFunction(name, "") {}

        virtual void add_parameter(int index, long long value)
        {
                PostStringFunction::add_parameter(1, value);
        }
};

class WBSayFunction: public PostStringFunction
{
public:
        WBSayFunction(std::string name = "Say"): PostStringFunction(name, "") {}
        
        virtual void add_parameter(int index, long long value)
        {
                PostStringFunction::add_parameter(1, value);
        }
};

class WBSpeechFunction: public PostStringFunction
{
public:
        WBSpeechFunction(std::string name = "Speech"): PostStringFunction(name, "") {}
        
        virtual void add_parameter(int index, long long value)
        {
                PostStringFunction::add_parameter(1, value);
        }
};

class WBSayStateFunction: public PostStringFunction
{
public:
        WBSayStateFunction(std::string name = "Say"): PostStringFunction(name, "") {}

        virtual void performv(Machine *m, ActionStage s, int i, va_list l)
        {
                stringstream ss;
                ss << _content << m->currentState()->name();
                setContent(ss.str().c_str());

                WBPostAction::performv(m, s, i, l);
                setContent("");
        }

        virtual void add_parameter(int index, long long value)
        {
                PostStringFunction::add_parameter(1, value);
        }
};

class WBSpeakStateFunction: public WBSayStateFunction
{
public:
        WBSpeakStateFunction(std::string name = "Speech"): WBSayStateFunction(name) {}
};


/*
 * CDL functions
 */
struct ProofFunction: public StringFunction
{
        virtual int evaluate(Machine *m = NULL)
        {
                if (!gucdlbridge) return -3;
                return gucdlbridge->update_proofs("", _content);
        }
};


struct LoadTheoryFunction: public StringFunction
{
        virtual int evaluate(Machine *m = NULL)
        {
                if (!gucdlbridge) return -3;
                return gucdlbridge->load_theory_file(_content);
        }
};



static void usage(const char *cmd)
{
        cerr << "Usage: " << cmd << " [-b][-k][-v] [fsm [...]]" << endl;
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

int main (int argc, char * const argv[])
{
        bool kripke_flag = false, verbose = false, want_cdl = true,
#ifdef __APPLE__
        blocks_flag = true;
#else
        blocks_flag = false;
#endif
        int ch;
        while ((ch = getopt(argc, argv, "BbCkv")) != -1)
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

