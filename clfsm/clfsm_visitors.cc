//
//  clfsm_visitors.cc
//  gufsm
//
//  Created by Jeremy Cade on 7/10/2014.
//  Copyright (c) 2014 MiPal. All rights reserved.
//

#include <cstdio>
#include <time.h>

#include "clfsm_visitors.h"
#include "FSMState.h"
#include "FSMSuspensibleMachine.h"
#include "FSMachineVector.h"
#include "clfsm_machine.h"
#include "clfsm_wb_vector_factory.h"
#include "gugenericwhiteboardobject.h"

using namespace std;
using namespace FSM;

/* 
 * Execution Time Macro
 * See: http://stackoverflow.com/a/876970 && http://stackoverflow.com/a/21327142
 */
#ifndef speedtest__
#define speedtest__(data)   for (clock_t t = clock(); printf(data "%.9fs", (double) (clock() - t) / CLOCKS_PER_SEC);)
#endif

bool CLFSMExecutionTimer::timer_visitor(void *ctx, SuspensibleMachine *machine, int machine_number)
{
    struct clfsm_context *context = static_cast<struct clfsm_context *>(ctx);
    CLFSMWBVectorFactory *factory = context->factory;
    const char *machineName = factory->name_of_machine_at_index(machine_number);
    speedtest__("Machines Execution Speed: ") {
        
        
    }
    return true;
}
