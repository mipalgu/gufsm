//
//  main.cpp
//  fsmWbDependencyDump
//
//  Created by Robert Coleman on 11/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "../gufsm/FSMANTLRMaths.h"
#include "../gufsm/FSMANTLRContext.h"

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

/* Print values. */
int printConditions(StateMachineVectorFactory &factory, ANTLRContext &antlr_context);

/* Silence all output. */
void silenceAllOutput();

/* Unsilence stdout. */
void unsilenceOutput();

int saved_streams[3]; // Saved stream file descriptors.

int main (int argc, char * const argv[])
{
    // Create Whiteboard.
    ANTLRContext antlr_context;
    // Machine names passed as parameters.
    vector<string> machine_names;
    #ifdef SILENCE
        silenceAllOutput();
    #endif

    bool c = FALSE;
    bool v = FALSE;
    
    int ch;
    while ((ch = getopt(argc, argv, "cv")) != -1)
    {
        switch (ch) {
            case 'c':
                // Conditions.
                
                if (!c && !v) { c = TRUE; }
                else {
                    cerr << "Two or more arguments do not make sense. Will now exit." << endl;
                    return 0;
                }
                
                break;
            case 'v':
                // Values.
                
                if (!c && !v) { v = TRUE; }
                else {
                    cerr << "Two or more arguments do not make sense. Will now exit." << endl;
                    return 0;
                }
                
                break;
            default:
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
    // Get the parameters.
    while (argc-- > 0) {
        machine_names.push_back(*argv++);
    }
    // Load the machines by name into gufsm.
    StateMachineVectorFactory factory(&antlr_context, machine_names);
    
    // Unsilence the program and print the values or conditions.
    #ifdef SILENCE
        unsilenceOutput();
    #endif
    if (c) {
        if (!printConditions(factory, antlr_context)) {
            cout << "An error occurred within fsmWbDependencyDump." << endl;
            return 1;
        }
    } else if (v) {
        
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
    
    vector<string>::iterator it;
    for (it = variable_names.begin(); it != variable_names.end(); it++) {
        cout << *it << endl;
    }
    
    return 1;
}

void silenceAllOutput() {
    // Save descriptors.
    saved_streams[1] = dup(1);
    saved_streams[2] = dup(2);
    // Silence all streams.
    freopen("/dev/null", "w", stdout);
    freopen("/dev/null", "w", stderr);
}

void unsilenceOutput() {
    // Create descriptor to stdout again.
    char stdout_path[20];
    sprintf(stdout_path, "/dev/fd/%d", saved_streams[1]);
    // Re-open stdout.
    freopen(stdout_path, "w", stdout);
}
