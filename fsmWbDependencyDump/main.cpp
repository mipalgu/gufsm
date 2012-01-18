//
//  main.cpp
//  fsmWbDependencyDump
//
//  Created by Robert Coleman on 11/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "../gufsm/FSMANTLRMaths.h"
#include "../gufsm/FSMANTLRContext.h"
#include "../gufsm/FSMANTLRAction.h"

#include <iostream>
#include <sstream>
#include <unistd.h>
#include <cstdio>
#include <gu_util.h>

#include "../gufsm/FSMState.h"
#include "../gufsm/FSMExpression.h"
#include "../gufsm/FSMWBPostAction.h"
#include "../gufsm/FSMVectorFactory.h"

#define ANTLRFunc(x,n)  x func ## x; \
                        antlr_context.set_function((n), &func ## x);
#define ANTLRMaths(x)   ANTLRMaths ## x func ## x; \
                        antlr_context.set_function(func ## x.name(), &func ## x);

#define SILENCE // Silence output. This is desired as any output is going to be
                // used in a script this program was designed for.

using namespace std;
using namespace FSM;

/* Read from 'input', strings seperated by whitespace, and write the
 * tokens to 'output'. */
int tokenize(string &input, vector<string> &output);

/* Test tokenize function. */
void test_tokenize();

/* Print conditions. */
int printConditions(StateMachineVectorFactory &factory, ANTLRContext &antlr_context);

/* Print values. */
int printValues(StateMachineVectorFactory &factory, ANTLRContext &antlr_context);

/* Silence all output. */
void silenceAllOutput();

/* Unsilence stdout. */
void unsilenceOutput();

int saved_streams[3];        // Saved stream file descriptors.
vector<string> machine_name; // Machine name passed as a parameter.
vector<string> values;       // The first parameter in any function.

/* Callback function class. */
class PostFunctionCallback: public WBPostAction<const char *> {
public:
    // Default constructor.
    PostFunctionCallback() : WBPostAction<const char *>() {}
    
    // Use this to record the first parameter.
    void add_parameter(int index, long long value) {
        if (index == 0) {
            string parameter = (const char *) value;
            values.push_back(parameter);
        }
    }
    
    void performv(Machine *m, ActionStage, int, va_list) {
       // We don't want to do anything here as it is pointless.
        string type = _type;
    }

};

int main (int argc, char * const argv[])
{
    // Create Whiteboard.
    ANTLRContext antlr_context;
    // Possibly silence this process by redirecting output to dev/null.
    #ifdef SILENCE
        silenceAllOutput();
    #endif

    bool c = FALSE;
    bool v = FALSE;
    
    int ch;
    while ((ch = getopt(argc, argv, "c:v:")) != -1)
    {
        switch (ch) {
            case 'c':
                // Conditions.
                
                if (!c && !v) { c = TRUE; }
                else {
                    cerr << "Two or more arguments do not make sense. Will now exit." << endl;
                    return 0;
                }
                // Save the name of the machine we are going to load.
                machine_name.push_back(optarg);
                break;
            case 'v':
                // Values.
                
                if (!c && !v) { v = TRUE; }
                else {
                    cerr << "Two or more arguments do not make sense. Will now exit." << endl;
                    return 0;
                }
                // Save the name of the machine we are going to load.
                machine_name.push_back(optarg);
                break;
            default:
                cerr << "Argument required." << endl;
                break;
        }
    }
    if (optind == 0) {
        // No options.
        cout << "Use option 'c' for conditions or option 'v' for vales" << endl;
    }

    if (argc <= 1) {
        cout << "fsmWbDependencyDump error: no arguments." << endl;
        return 0;
    }
    argc -= optind;
    argv += optind;

    // Load the machines by name into gufsm.
    StateMachineVectorFactory factory(&antlr_context, machine_name);
    
    if (c) {
        if (!printConditions(factory, antlr_context)) {
            cout << "An error occurred within fsmWbDependencyDump, conditions." << endl;
            return 1;
        }
    } else if (v) {
        if (!printValues(factory, antlr_context)) {
            cout << "An error occurred within fsmWbDependencyDump, values." << endl;
            return 1;
        }
    }
    return 0;
}

int tokenize(string &input, vector<string> &output) {
    string::iterator strIt;
    // Index of first character to substring, index after last character to substring.
    int first = 0, last = 0;
    for (strIt = input.begin(); strIt != input.end(); strIt++) {
        char c = *strIt;
        
        if (c == ' ') {
            if (first != last) {
                // Push what we have decided to substring so far.
                string sub = input.substr(first, last-first);
                output.push_back(sub);
            }
            first = ++last;
        } else {
            last++;
        }
    }
    // Push the last token.
    if (first != last) {
        string sub = input.substr(first, last);
        output.push_back(sub);
    }
    
    return 0;
}

void test_tokenize() {
    string input = "hello 1 world";
    vector<string> output;
    tokenize(input, output);
    cout << "TOKENIZED" << endl;
    vector<string>::iterator it;
    for (it = output.begin(); it != output.end(); it++) {
        cout << *it << endl;
    }
}

int printConditions(StateMachineVectorFactory &factory, ANTLRContext &antlr_context) {
    // Tokenized internal variable names.
    vector<string> variable_names;
    // Get a list of all the variable names
    string allNames = antlr_context.allNames();
    tokenize(allNames, variable_names);
    unsilenceOutput();
    // Print all variables which are global. We use the double dollar signs to
    //  decide this.
    vector<string>::iterator it;
    for (it = variable_names.begin(); it != variable_names.end(); it++) {
        string temp = *it;
        if (temp.find("$$") == string::npos)
            cout << temp << endl;
    }   
    
    return 1;
}

int printValues(StateMachineVectorFactory &factory, ANTLRContext &antlr_context) {
    // Get the index of this machine.
    int thisMachineIndex = factory.index_of_machine_named(machine_name[0]);
    // Get a list of all the machines in the factory.
    StateMachineVector * allStateMachines = factory.fsms();
    MachineVector allStateMachines_v = allStateMachines->machines();
    // Use the index to get a reference to this machine.
    SuspensibleMachine * thisMachine = allStateMachines_v[thisMachineIndex];
    StateVector states = thisMachine->states();
    
    // Set up out callback function that merely records all of the post parameters.
    ANTLRFunc(PostFunctionCallback,    "post");
    antlr_context.set_function("post_int", &funcPostFunctionCallback);
    antlr_context.set_function("postv", &funcPostFunctionCallback);
    antlr_context.set_function("suspend", &funcPostFunctionCallback);
    antlr_context.set_function("resume", &funcPostFunctionCallback);
    antlr_context.set_function("restart", &funcPostFunctionCallback);
    
    // We want to call 'evaluate' on each command in each state.
    StateVector::iterator it;
    for (it = states.begin(); it != states.end(); it++) {
        thisMachine->setCurrentState(*it);
        thisMachine->executeOnEntry();
        // Never mind what transition it takes, just as so it is not null.
        thisMachine->executeOnExitForTransitionWithIndex(0);
        thisMachine->executeInternal();
    }
    unsilenceOutput();
    // Print all the values retrieved to standard output.
    vector<string>::iterator it_s;
    for (it_s = values.begin(); it_s != values.end(); it_s++) {
        cout << *it_s << endl;
    }
    
    return 1;
}

void silenceAllOutput() {
#ifdef SILENCE
    // Save descriptors.
    saved_streams[1] = dup(1);
    saved_streams[2] = dup(2);
    // Silence all streams.
    freopen("/dev/null", "w", stdout);
    freopen("/dev/null", "w", stderr);
#endif
}

void unsilenceOutput() {
#ifdef SILENCE
    // Create descriptor to stdout again.
    char stdout_path[20];
    sprintf(stdout_path, "/dev/fd/%d", saved_streams[1]);
    // Re-open stdout.
    freopen(stdout_path, "w", stdout);
#endif
}
