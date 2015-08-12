#include "API_MetaState.h"
#include "API_MetaAction.h"
#include "API_MetaMachine_Internal.h"
#include "API_Util.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

//! Initialises the meta state
refl_metaState refl_initMetaState(CLReflectResult *result)
{
    refl_metaState newMetaState = (refl_metaState)malloc(sizeof(struct metaState_s));
    if (newMetaState != NULL)
    {
        newMetaState->name = NULL;
        newMetaState->onEntry = NULL;
        newMetaState->internal = NULL;
        newMetaState->onExit = NULL;
        if (result)
            *result = REFL_SUCCESS;
        return newMetaState;
    }
    else
    {
        if (result)
            *result = REFL_UNKNOWN_ERROR;
        return NULL;
    }

}

//! Destroys the meta-state
void refl_destroyMetaState(refl_metaState metaState, CLReflectResult* result)
{
    if (metaState)
    {
        free(metaState->name);
        refl_destroyMetaAction(metaState->onEntry);
        refl_destroyMetaAction(metaState->internal);
        refl_destroyMetaAction(metaState->onExit);
        free(metaState);
        if (result)
            *result = REFL_SUCCESS;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
    }

}

//! Sets the state name
void refl_setMetaStateName(refl_metaState metaState, char const * name, CLReflectResult* result)
{
    if (!metaState || !name)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        free(metaState->name); // Free the old machine name. Guaranteed heap mem.
        int len = (int)strlen(name) + 1;
        metaState->name = (char *)malloc(sizeof(char) *  len);
        CLReflectResult res;
        if (metaState->name == NULL)
        {
            res = REFL_UNKNOWN_ERROR;
        }
        else
        {
            res = refl_strcpy(metaState->name, name, len);
        }
        if (result)
            *result = res;
    }
}

//! Gets the state name
CLReflectResult refl_getMetaStateName(refl_metaState metaState, char* buffer, int bufferLen)
{
    if (!metaState)
    {
        return REFL_INVALID_ARGS; //name has not been set
    }
    return refl_strcpy(buffer, metaState->name, bufferLen);
}

//! Sets the OnEntry function
CLReflectResult refl_setOnEntry(refl_metaState metaState, refl_metaAction action)
{
    if (!metaState || !action)
    {
        return REFL_INVALID_ARGS;
    }
    metaState->onEntry = action;
    return REFL_SUCCESS;
}

CLReflectResult refl_setInternal(refl_metaState metaState, refl_metaAction action)
{
    if (!metaState || !action)
    {
        return REFL_INVALID_ARGS;
    }
    metaState->internal = action;
    return REFL_SUCCESS;
}

CLReflectResult refl_setOnExit(refl_metaState metaState, refl_metaAction action)
{
    if (!metaState || !action)
    {
        return REFL_INVALID_ARGS;
    }
    metaState->onExit = action;
    return REFL_SUCCESS;
}
