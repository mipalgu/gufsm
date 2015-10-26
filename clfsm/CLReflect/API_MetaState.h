/*!
    @file API_MetaState.h
*/

#ifndef API_METASTATE
#define API_METASTATE

#include "API_Result.h"
#include "API_MetaTransition.h"
#include "API_MetaAction.h"

struct metaState_s;
typedef struct metaState_s* refl_metaState;

/*!
    Initialises the meta state
    @param result The result of the call.
    @return A new initialised meta-state
*/
refl_metaState refl_initMetaState(CLReflectResult *result);

/*!
    Destroys the meta state    
    @param result The result of the call.
*/
void refl_destroyMetaState(refl_metaState metaState, CLReflectResult* result);

/*!
    Sets the meta state
    @param metaState The metaState
    @param name The name of the state
    @param result The result of the call.
*/
void refl_setMetaStateName(refl_metaState metaState, char const * name, CLReflectResult* result);

/*!
    Gets a pointer to the meta state name
    @param metaState The metaState
    @param result The result of the call.
    @return A pointer to the meta-state name
*/
const char* refl_getMetaStateName(refl_metaState metaState, CLReflectResult *result);

/*!
    Sets the state's onEntry function.
    @param metaState The metaState
    @param action The meta-action encapsulating the OnEntry function
    @param result The result of the call.
*/
void refl_setOnEntry(refl_metaState metaState, refl_metaAction action, CLReflectResult *result);

/*!
    Sets the state's Internal function.
    @param metaState The metaState
    @param action The meta-action encapsulating the Internal function
    @param result The result of the call.
*/
void refl_setInternal(refl_metaState metaState, refl_metaAction action, CLReflectResult *result);

/*!
    Sets the state's OnExit function.
    @param metaState The metaState
    @param action The meta-action encapsulating the OnExit function
    @param result The result of the call.
*/
void refl_setOnExit(refl_metaState metaState, refl_metaAction action, CLReflectResult *result);

/*!
    Sets the state's meta-transitions
    @param metaState The metaState
    @param transitions An array of meta-transitions that represent the state's outgoing transitions.
    @param len The length of the transitions array.
    @param result The result of the call.
*/
void refl_setMetaTransitions(refl_metaState metaState, refl_metaTransition* transitions, unsigned int len, CLReflectResult* result);

/*!
    Gets the length of the meta-state's meta-transitions array
    @param metaState The metaState
    @param result The result of the call.
    @return The number of transitions.
*/
unsigned int refl_getNumberOfTransitions(refl_metaState metaState, CLReflectResult* result);

/*!
    Gets the meta-state's meta-transition array
    @param metaState The metaState
    @param result The result of the call.
    @return The meta-state's transition array.
*/
refl_metaTransition const * refl_getMetaTransitions(refl_metaState metaState, CLReflectResult* result);

#endif /* end of include guard: API_METASTATE */
