#ifndef API_MACHINECONTROL_H
#define API_MACHINECONTROL_H

#include "API_MetaMachine.h"
#include "API_MetaMachine_Internal.h"
#include "API_Result.h"

/*!
    Returns the current state of the FSM.
    @param metaMachine The metamachine.
    @param result An optional pointer in which the return status will be placed.
                  result = REFL_SUCCESS on success,
                           REFL_INVALID_ARGS if metaMachine is NULL
    @return The current state of the machine as an index.
*/
unsigned int refl_getCurrentState(refl_metaMachine metaMachine, CLReflectResult* result);

/*!
    Sets the current state of the FSM.
    @param metaMachine The metamachine.
    @param stateIndex The new index
    @param result An optional pointer in which the return status will be placed.
                  result = REFL_SUCCESS on success,
                           REFL_INVALID_ARGS if metaMachine is NULL or if stateIndex >= number of states in metaMachine.
*/
void refl_setCurrentState(refl_metaMachine metaMachine, unsigned int stateIndex, CLReflectResult* result);

/*!
    Gets the previous state of the FSM
    @param metaMachine The metamachine.
    @param result An optional pointer in which the return status will be placed.
                  result = REFL_SUCCESS on success,
                           REFL_INVALID_ARGS if metaMachine is NULL.
    @return The previous state as an index. -1 if the currentState is the first state i.e. there is no previous state.
*/
int refl_getPreviousState(refl_metaMachine metaMachine, CLReflectResult *result);

/*!
    Sets the previous state of the FSM.
    @param metaMachine The metamachine.
    @param stateIndex The new previous state index
    @param result An optional pointer in which the return status will be placed.
                  result = REFL_SUCCESS on success,
                           REFL_INVALID_ARGS if metaMachine is NULL or if stateIndex >= number of states in metaMachine.
*/
void refl_setPreviousState(refl_metaMachine metaMachine, unsigned int stateIndex, CLReflectResult* result);


#endif /* end of include guard: API_MACHINECONTROL_H */
