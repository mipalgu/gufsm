/*!
    @file API_MetaAction.c
*/

#include "API_MetaAction.h"
#include "API_MetaMachine_Internal.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
#pragma clang diagnostic ignored "-Wbuiltin-requires-header"

#include <stdlib.h>

#pragma clang diagnostic pop

//! Inits the meta-action
refl_metaAction refl_initMetaAction(CLReflectResult* result)
{
    refl_metaAction newAction = (refl_metaAction)malloc(sizeof(struct metaAction_s));
    if (newAction != NULL)
    {
        newAction->action = NULL;
        newAction->data = NULL;
        if (result)
            *result = REFL_SUCCESS;
        return newAction;
    }
    else
    {
        if (result)
            *result = REFL_UNKNOWN_ERROR;
        return NULL;
    }
}

//! Destroys the meta action
void refl_destroyMetaAction(refl_metaAction metaAction, CLReflectResult* result)
{
    free(metaAction);
    if (result)
        *result = REFL_SUCCESS;
}


//! Gets the action function pointer
refl_stateAction_f refl_getMetaActionMethod(refl_metaAction metaAction, CLReflectResult* result)
{
    if (!metaAction)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
        return NULL;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
        return metaAction->action;
    }

}

//! Sets the action function pointer
void refl_setMetaActionMethod(refl_metaAction metaAction, refl_stateAction_f method, CLReflectResult* result)
{
    if (!metaAction)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        metaAction->action = method;
        if (result)
            *result = REFL_SUCCESS;
    }

}

//! Sets the user data
void refl_setMetaActionData(refl_metaAction metaAction, refl_userData_t data, CLReflectResult* result)
{
    if (!metaAction)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        metaAction->data = data;
        if (result)
            *result = REFL_SUCCESS;
    }

}

//! Gets the user data
refl_userData_t refl_getMetaActionData(refl_metaAction metaAction, CLReflectResult* result)
{
    if (!metaAction)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
        return NULL;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
        return metaAction->data;
    }

}
