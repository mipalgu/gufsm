//
//  main.c
//  fsmWbModuleDependencyDump
//
//  Created by Robert Coleman on 10/01/12.
//  Copyright (c) 2012 All rights reserved.
//

#include "../../gufsm/FSMANTLRMaths.h"
#include "../../gufsm/FSMANTLRContext.h"

#include <iostream>

#include "../../gufsm/FSMState.h"
#include "../../gufsm/FSMExpression.h"
#include "../../gufsm/FSMWBPostAction.h"
#include "../../gufsm/FSMVectorFactory.h"

#define ANTLRFunc(x,n)  x func ## x; \
antlr_context.set_function((n), &func ## x);
#define ANTLRMaths(x)   ANTLRMaths ## x func ## x; \
antlr_context.set_function(func ## x.name(), &func ## x);

using namespace std;
using namespace FSM;

int main (int argc, const char * argv[])
{
    // Create Whiteboard.
    ANTLRContext antlr_context;
    // Machine names passed as parameters.
    vector<string> machine_names;
    // Load the machines by name into gufsm.
    StateMachineVectorFactory factory(&antlr_context, machine_names);
    
    int ch;
    if ((ch = getopt(argc, argv, "cv")) != -1)
    {
        switch (ch) {
            case 'c':
                // Conditions.
                break;
            case 'v':
                // Values.
                break;
            default:
                break;
        }
    } else {
        // No options.
        cout << "Use option 'c' for conditions or option 'v' for vales" << endl;
    }
    return 0;
}

