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

int main (int argc, char * const argv[])
{
    // Create Whiteboard.
    ANTLRContext antlr_context;
    // Machine names passed as parameters.
    vector<string> machine_names;
    // Verbose?
    bool verbose = FALSE;
#ifdef VERBOSE_OUTPUT
    verbose = TRUE;
#endif
    
    int ch;
    if ((ch = getopt(argc, argv, "cv")) != -1)
    {
        switch (ch) {
            case 'c':
                // Conditions.
                if (verbose)
                    cout << "Start dumping conditions." << endl;
                break;
            case 'v':
                // Values.
                if (verbose)
                    cout << "Start dumping values." << endl;
                break;
            default:
                break;
        }
    } else {
        // No options.
        cout << "Use option 'c' for conditions or option 'v' for vales" << endl;
    }
    
    if (argc <= 1) {
        cout << "fsmWbDependencyDump error: no arguments." << endl;
        return 0;
    }
    // Get the parameters.
    while (argc-- > 0) {
        machine_names.push_back(*argv++);
    }
    // Load the machines by name into gufsm.
    StateMachineVectorFactory factory(&antlr_context, machine_names);
    
    cout << factory.fsms()->description() << endl;
    
    return 0;
}

