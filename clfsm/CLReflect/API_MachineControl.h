#ifndef API_MACHINECONTROL_H
#define API_MACHINECONTROL_H

#include "API_MetaMachine.h"
#include "API_MetaMachine_Internal.h"
#include "API_Result.h"

/*!
    Sets the current state of the FSM.
*/
unsigned int refl_getCurrentState(refl_metaMachine metaMachine, CLReflectResult* result);

/*!
    Returns the current state of the FSM.
*/
void refl_setCurrentState(refl_metaMachine metaMachine, CLReflectResult* result);

#endif /* end of include guard: API_MACHINECONTROL_H */
