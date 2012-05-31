//
//  FSMVectorRunner.cc
//  
//
//  Created by René Hexel on 31/05/12.
//  Copyright (c) 2012 Rene Hexel. All rights reserved.
//
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
                
                PostStringFunction::performv(m, s, i, l);
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


int run_machine_vector(StateMachineVectorFactory &factory, vector<string> &machine_names, machine_runner_f execute, bool verbose)
{
        ANTLRContext &antlr_context = factory.context();

        ANTLRFunc(TimeoutPredicate,     "timeout");
        ANTLRFunc(SystemFunction,       "system");
#ifdef NEED_SLEEP
        ANTLRFunc(SleepFunction,        "sleep");
#endif
        ANTLRFunc(PrintStatenameFunction, "print_state_name");
        ANTLRFunc(PrintStringAction,    "print");
        ANTLRFunc(PrintIntAction,       "print_int");
        ANTLRFunc(PrintFixedAction,     "print_fixed");
        ANTLRFunc(PostStringFunction,   "post");
        ANTLRFunc(PostIntFunction,      "post_int");
        ANTLRFunc(WBPostIntVecAction,   "postv");
        ANTLRFunc(WBSuspendFunction,    "suspend");
        ANTLRFunc(WBResumeFunction,     "resume");
        ANTLRFunc(WBRestartFunction,    "restart");
        
        ANTLRFunc(WBSayFunction,        "say");                 // sends Say
        ANTLRFunc(WBSpeechFunction,     "speech");              // sends Speech
        ANTLRFunc(WBSayStateFunction,   "say_state_name");      // sends Say
        ANTLRFunc(WBSpeakStateFunction, "speak_state_name");    // sends Speech
        
        ANTLRFunc(LoadTheoryFunction,   "load_theory");
        ANTLRFunc(ProofFunction,        "prove");
        
        /*
         * maths functions
         */
        ANTLRMaths(Abs);
        ANTLRMaths(Sign);
        ANTLRMaths(Random);
        ANTLRMaths(SRandom);
        ANTLRMaths(Sin);
        ANTLRMaths(Cos);
        ANTLRMaths(Tan);
        ANTLRMaths(Cot);
        ANTLRMaths(ATan);
        ANTLRMaths(ASin);
        ANTLRMaths(ACos);
        ANTLRMaths(Log);
        ANTLRMaths(Ld);
        ANTLRMaths(Lg);
        
        ANTLRMaths(Min);
        ANTLRMaths(Max);
        ANTLRMaths(Avg);
        ANTLRMaths(FTA);
        ANTLRMaths(GAvg);
        
        if (verbose)
        {
                string descr = factory.fsms()->description();
                cout << descr << endl;
        }

        return execute(factory, machine_names);
}

