/*!
    @file API_MetaMachine.h
*/

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

/*! Sets the meta machine name to the given parameter. The string content of name is copied.
    @param machine The meta machine
    @param name The new name.
    @param result The result of the call
*/
void refl_setMetaMachineName(refl_metaMachine machine, char const * name, CLReflectResult* result);

/*! Returns a pointer to the machine's name.
    @param machine The meta machine
    @param result The result of the call.
    @return A pointer to a heap allocated string.
*/
const char * refl_getMetaMachineName(refl_metaMachine machine, CLReflectResult* result);

/*!
    Sets the actual FSM for this meta machine
    @param metaMachine The metamachine
    @param machine The executable FSM
    @param result A pointer to an int in which the result is placed.
*/
void refl_setMachine(refl_metaMachine metaMachine, refl_machine_t machine, CLReflectResult *result);

/*!
    Sets the meta-FSMs states.
    @param machine The meta-FSM
    @param states An array of states of length len
    @param len The length of the states array.
    @param result The result of the call.
*/
void refl_setMetaStates(refl_metaMachine machine, refl_metaState* states, int len, CLReflectResult* result);

/*!
    Gets the number of states in the meta-FSM
    @param machine The meta-FSM
    @param result The result of the call.
    @return The number of states.
*/
unsigned int refl_getNumberOfStates(refl_metaMachine machine, CLReflectResult* result);

/*!
    Gets the array of meta-FSM states.
    @param metaMachine The meta-FSM.
    @param result The result of the call.
    @return A pointer to an array of the meta-FSM's states
*/
refl_metaState * refl_getMetaStates(refl_metaMachine metaMachine, CLReflectResult *result);

/*!
    Invokes the onEntry action of the given state of the FSM.
    @param metaMachine The meta-FSM owning the state of which the action is being invoked.
    @param stateNum The index of the state in the array returned by refl_getMetaStates
    @param result The result of the call.
*/
void refl_invokeOnEntry(refl_metaMachine metaMachine, unsigned int stateNum, CLReflectResult* result);

/*!
    Invokes the internal action of the given state of the FSM.
    @param metaMachine The meta-FSM owning the state of which the action is being invoked.
    @param stateNum The index of the state in the array returned by refl_getMetaStates
    @param result The result of the call.
*/
void refl_invokeInternal(refl_metaMachine metaMachine, unsigned int stateNum, CLReflectResult* result);

/*!
    Invokes the onExit action of the given state of the FSM.
    @param metaMachine The meta-FSM owning the state of which the action is being invoked.
    @param stateNum The index of the state in the array returned by refl_getMetaStates
    @param result The result of the call.
*/
void refl_invokeOnExit(refl_metaMachine metaMachine, unsigned int stateNum, CLReflectResult* result);


/*!
    Evaluates a transition of a given state.
    @param metaMachine The metaFSM owning the state (and transition)
    @param stateNum The index of the state from which the transition eminates
    @param transitionNum THe index of the transition in the state
    @param result The result of the call.
*/
refl_bool refl_evaluateTransition(refl_metaMachine metaMachine, unsigned int stateNum, unsigned int transitionNum, CLReflectResult *result);

/*!
    Allows a user defined destructor callback to be set. This is called prior to the API
    destroying the meta-FSM within refl_destroyMetaMachine(). The user-defined destructor should not delete any
    CLReflectAPI data related to the meta-FSM e.g. meta-states, as this is performed
    in the refl_destroyMetaMachine() call.
    @param metaMachine The meta machine.
    @param destructFunction The user defined destructor function.
    @param result The result of the call.
*/
void refl_setDestructorAction(refl_metaMachine metaMachine, refl_destuctor_f destructFunction, CLReflectResult* result);


#endif /* end of include guard: API_METAMACHINE_H */
