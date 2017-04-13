/*!
    @file API_MetaTransition.h
*/

#ifndef API_METATRANSITION_H
#define API_METATRANSITION_H

#include "API_Result.h"
#include "CLReflectFunctionPointerTypes.h"

struct metaTransition_s;
typedef struct metaTransition_s* refl_metaTransition;

/*!
    Allocates and initialises a meta-transition
    @param result The result of the call.
*/
refl_metaTransition refl_initMetaTransition(CLReflectResult* result);

/*!
    Deallocates a meta-transition.
    @param trans The meta-transition being deleted.
    @param result The result of the call.
*/
void refl_destroyMetaTransition(refl_metaTransition trans, CLReflectResult* result);

/*!
    Gets the target of the transition as an index into the meta-FSM's state array.
    @param trans The meta-transition
    @param result The result of the call.
    @return The meta-transition's target state.
*/
int refl_getMetaTransitionTarget(refl_metaTransition trans, CLReflectResult* result);

/*!
    Sets the meta-transition's target state
    @param trans The meta-transition.
    @param result The result of the call.
    @param target The target state as an index into the meta-FSM's state array.
*/
void refl_setMetaTransitionTarget(refl_metaTransition trans, unsigned int target, CLReflectResult* result);

/*!
    Gets the source of the transition as an index into the meta-FSM's state array.
    @param trans The meta-transition
    @param result The result of the call.
    @return The meta-transition's source state.
*/
int refl_getMetaTransitionSource(refl_metaTransition trans, CLReflectResult* result);

/*!
    Sets the meta-transition's source state
    @param trans The meta-transition.
    @param result The result of the call.
    @param source The source state as an index into the meta-FSM's state array.
*/
void refl_setMetaTransitionSource(refl_metaTransition trans, unsigned int source, CLReflectResult* result);

/*!
    Gets the meta-transition's evaluation call-back function.
    @param trans The meta-transition
    @param result The result of the call.
    @return The meta-transition's call-back function.
*/
refl_transitionEval_f refl_getMetaTransitionEvalFunction(refl_metaTransition trans, CLReflectResult* result);

/*!
    Sets the meta-transition's evaluation call-back function
    @param trans The meta-transition.
    @param result The result of the call.
    @param func The call-back function.
    @param data A pointer to an optional set of parameters that are passed through to the call-back function when invoked.
*/
void refl_setMetaTransitionEvalFunction(refl_metaTransition trans, refl_transitionEval_f func, refl_userData_t data, CLReflectResult* result);

/*!
    Gets the meta-transition's user data parameter that is passed to its evaluation call-back function.
    @param trans The meta-transition
    @param result The result of the call.
    @return The transition data parameter.
*/
refl_userData_t refl_getMetaTransitionData(refl_metaTransition trans, CLReflectResult* result);

/*!
    Gets the meta-transition's transition expression as a human-readable string.
    @param trans The meta-transition.
    @param result The result of the call.
    @return A pointer to the meta-transition's transition expression as a human-readable string.
*/
const char * refl_getMetaTransitionExpression(refl_metaTransition trans, CLReflectResult* result);

/*!
    Sets the meta-transition's transition expression as a human-readable string.
    @param trans The meta-transition.
    @param result The result of the call.
    @param exp A human-readable representation of the transitions logic expression.
*/
void refl_setMetaTransitionExpression(refl_metaTransition trans, char const * exp, CLReflectResult* result);

#endif /* end of include guard: API_METATRANSITION_H */
