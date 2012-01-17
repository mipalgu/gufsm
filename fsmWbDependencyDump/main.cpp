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
#include <gu_util.h>

#include "../gufsm/FSMState.h"
#include "../gufsm/FSMExpression.h"
#include "../gufsm/FSMWBPostAction.h"
#include "../gufsm/FSMVectorFactory.h"

#define ANTLRFunc(x,n)  x func ## x; \
                        antlr_context.set_function((n), &func ## x);
#define ANTLRMaths(x)   ANTLRMaths ## x func ## x; \
                        antlr_context.set_function(func ## x.name(), &func ## x);

#define VERBOSE_OUTPUT

using namespace std;
using namespace FSM;

/* Read from 'input', strings seperated by whitespace, and write the
 * tokens to 'output'. */
int tokenize(string &input, vector<string> &output);

/* Test tokenize function. */
void test_tokenize();

/* Print values. */
int printValues(StateMachineVectorFactory &factory, ANTLRContext &antlr_context);

bool verbose;

int main (int argc, char * const argv[])
{
    // Create Whiteboard.
    ANTLRContext antlr_context;
    // Machine names passed as parameters.
    vector<string> machine_names;
    
    bool c = FALSE;
    bool v = FALSE;
    verbose = FALSE;
#ifdef VERBOSE_OUTPUT
    verbose = TRUE;
#endif
    
    int ch;
    while ((ch = getopt(argc, argv, "cv")) != -1)
    {
        switch (ch) {
            case 'c':
                // Conditions.
                if (verbose)
                    cout << "Start dumping conditions." << endl;
                
                if (!c && !v) { c = TRUE; }
                else {
                    cerr << "Two or more arguments do not make sense. Will now exit." << endl;
                    return 0;
                }
                
                break;
            case 'v':
                // Values.
                if (verbose)
                    cout << "Start dumping values." << endl;
                
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
    
    if (v) {
        if (printValues(factory, antlr_context))
            return 0;
        else
            return 1;
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
                string sub = input.substr(first, last);
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
    string input = "hello world";
    vector<string> output;
    tokenize(input, output);
    cout << "TOKENIZED" << endl;
    vector<string>::iterator it;
    for (it = output.begin(); it != output.end(); it++) {
        cout << *it << endl;
    }
}

int printValues(StateMachineVectorFactory &factory, ANTLRContext &antlr_context) {
    // Tokenized internal variable names.
    vector<string> variable_names;
    // Get a list of all the variable names
    string allNames = antlr_context.allNames();
    tokenize(allNames, variable_names);
    
    if (verbose) { cout << "ALL NAMES" << endl; }
    vector<string>::iterator it;
    for (it = variable_names.begin(); it != variable_names.end(); it++) {
        cout << *it << endl;
    }
    
    return 1;
}

