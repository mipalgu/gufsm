//
//  ExecComStruct.h
//  qfsm
//
//  Created by Robert Coleman on 22/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

/* 
 * Data structure used for communication with the executing
 * state machines.
 */
#ifndef ExecCom_Do_h
#define ExecCom_Do_h

#include <dispatch/dispatch.h>

namespace ExecCom {
        enum ExecCom_Do_Type {SUSPEND, RESTART, STOP, RESUME, RUN};
        enum ExecCom_State_Type {SUSPENDED, RUNNING, STOPPED};
}

// Execution Communication.
struct ExecCom_Struct {
        /* Will need to be procured before changing or accessing
         * the flag. */
        dispatch_semaphore_t _flagProtect;
        
        /* What should the executer do? */
        enum ExecCom::ExecCom_Do_Type _shouldDo;
        
        /* What executing state are all the machines in? */
        enum ExecCom::ExecCom_State_Type _state;
        
        /* What machine is currently being evaluated? */
        int _currentExecutingMachineId;
        
        /* What is the current executing state in the machine
         * currently being evaluated? */
        int _currentExecutingStateID;
};

#endif