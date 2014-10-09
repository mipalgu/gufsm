//
//  clfsm_visitors.h
//  gufsm
//
//  Created by Jeremy Cade on 7/10/2014.
//  Copyright (c) 2014 MiPal. All rights reserved.
//

#ifndef __gufsm__clfsm_visitors__
#define __gufsm__clfsm_visitors__

#include <stdio.h>

// Visitor Function is defined in FSMMachineVector.h as:
// typedef bool (*visitor_f)(void *context, SuspensibleMachine *machine, int machine_number);
// Visitors should always conform. Failure to do so will result in very unhappy compiler
// We like happy compiler \\^_^//

namespace FSM {
    class CLMachine;
    class CLState;
    class SuspensibleMachine;
    class Context;
    class State;
    
    class CLFSMExecutionTimer
    {
    public:
        static bool timer_visitor(void *context, SuspensibleMachine *machine, int machine_number);
    };
    
    // TODO: Merge Kripke State Generation into this file at a later date. -- Jeremy 20141007
}

#endif /* defined(__gufsm__clfsm_visitors__) */
