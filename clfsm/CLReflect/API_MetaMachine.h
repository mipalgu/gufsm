#ifndef API_METAMACHINE_H
#define API_METAMACHINE_H

#include "API_Result.h"
#include "API_MetaState.h"
#include "API_MetaProperty.h"

struct metaMachine_s;
typedef struct metaMachine_s* refl_metaMachine;

/*! Initialises and allocates memory for the meta-machine
    @param result The result of the call.
    @return A new heap-allocated meta-machine
*/
refl_metaMachine refl_initMetaMachine(CLReflectResult* result);

/*! Deallocates the meta machine
    @param machine The meta machine.
    @param result The result of the call
*/
void refl_destroyMetaMachine(refl_metaMachine machine, CLReflectResult* result);

/*! Sets the meta machine name to the given parameter.
    @param machine The meta machine
    @param name The new name.
    @param result The result of the call
*/
void refl_setMetaMachineName(refl_metaMachine machine, char const * name, CLReflectResult* result);

/*! Returns a copy of the machine's name. Caller is responsible for freeing the return value.
    @param machine The meta machine
    @param result The result of the call.
    @return A pointer to a heap allocated string.
*/
char* refl_getMetaMachineName(refl_metaMachine machine, CLReflectResult* result);

/*!
    Sets the actual FSM for this meta machine
    @param metaMachine The metamachine
    @param machine The executable FSM
    @param result A pointer to an int in which the result is placed.
*/
void refl_setMachine(refl_metaMachine metaMachine, refl_machine_t machine, CLReflectResult *result);

//! Sets the meta-machine's states
void refl_setMetaStates(refl_metaMachine machine, refl_metaState* states, int len, CLReflectResult* result);

//! Gets the number of states
unsigned int refl_getNumberOfStates(refl_metaMachine machine, CLReflectResult* result);

refl_metaState * refl_getMetaStates(refl_metaMachine metaMachine, CLReflectResult *result);

//! Invokes the OnEntry of a given state
void refl_invokeOnEntry(refl_metaMachine metaMachine, unsigned int stateNum, CLReflectResult* result);

void refl_invokeInternal(refl_metaMachine metaMachine, unsigned int stateNum, CLReflectResult* result);

void refl_invokeOnExit(refl_metaMachine metaMachine, unsigned int stateNum, CLReflectResult* result);

refl_bool refl_evaluateTransition(refl_metaMachine metaMachine, unsigned int stateNum, unsigned int transitionNum, CLReflectResult *result);

int refl_getCurrentState(refl_metaMachine metaMachine, CLReflectResult* result);

void refl_setCurrentStateFunction(refl_metaMachine metaMachine, refl_getCurrentState_f function, refl_userData_t data, CLReflectResult* result);


#endif /* end of include guard: API_METAMACHINE_H */
