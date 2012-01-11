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

using namespace std;
using namespace FSM;

int main (int argc, char * const argv[])
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

