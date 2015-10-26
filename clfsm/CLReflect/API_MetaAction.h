/*!
    @file API_MetaAction.h
*/

#ifndef API_METAACTION_H
#define API_METAACTION_H

#include "API_Result.h"
#include "CLReflectFunctionPointerTypes.h"

struct metaAction_s;
typedef struct metaAction_s* refl_metaAction;

/*!
    Inits the meta-action by allocating memory for it.
    @param result The result of the call.
    @return A new empty meta-action.
*/
refl_metaAction refl_initMetaAction(CLReflectResult* result);

/*!
    Destroys the meta action and frees its memory, including the memory held by any internal members.
    @param metaAction The meta-action being destroyed.
*/
void refl_destroyMetaAction(refl_metaAction metaAction, CLReflectResult* result);

/*!
    Gets the action's function pointer
    @param metaAction The meta-action
    @param result The result of the call.
    @return A meta-action function pointer, or NULL if it is not defined or metaAction = NULL.
*/
refl_stateAction_f refl_getMetaActionMethod(refl_metaAction metaAction, CLReflectResult* result);

/*!
    Sets the action callback function pointer
    @param metaAction The metaAction
    @param method A pointer to a function which executes the state action
    @param result The result of the call.
*/
void refl_setMetaActionMethod(refl_metaAction metaAction, refl_stateAction_f method, CLReflectResult* result);

/*!
    Sets the user data
    @param metaAction The meta-action
    @param data An arbitrary piece of data passed to the callback when it is invoked using the invoke*() methods.
    @param result The result of the call.
*/
void refl_setMetaActionData(refl_metaAction metaAction, refl_userData_t data, CLReflectResult* result);

/*!
    Gets the user data
    @param metaAction The meta-action
    @param result The result of the call.
    @return The user data, or NULL if it isn't set or if metaAction is NULL
*/
refl_userData_t refl_getMetaActionData(refl_metaAction metaAction, CLReflectResult* result);

#endif /* end of include guard: API_METAACTION_H */
