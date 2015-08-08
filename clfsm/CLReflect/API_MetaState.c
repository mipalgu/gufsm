#include "API_MetaState.h"
#include "API_MetaAction.h"
#include "API_MetaMachine_Internal.h"
#include "API_Util.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

//! Initialises the meta state
CLReflectResult refl_initMetaState(refl_metaState *metaState)
{
    refl_metaState newMetaState = (refl_metaState)malloc(sizeof(struct metaState_s));
    if (newMetaState != NULL)
    {
        newMetaState->name = NULL;
        newMetaState->onEntry = NULL;
        newMetaState->internal = NULL;
        newMetaState->onExit = NULL;
        *metaState = newMetaState;
        return REFL_SUCCESS;
    }
    else
    {
        return REFL_UNKNOWN_ERROR;
    }
}

//! Destroys the meta-state
CLReflectResult refl_destroyMetaState(refl_metaState metaState)
{
    if (metaState)
    {
        free(metaState->name);
        refl_destroyMetaAction(metaState->onEntry);
        refl_destroyMetaAction(metaState->internal);
        refl_destroyMetaAction(metaState->onExit);
        free(metaState);
    }
    return REFL_SUCCESS;
}

//! Sets the state name
CLReflectResult refl_setMetaStateName(refl_metaState metaState, char* name)
{
    if (!metaState || !name)
    {
        return REFL_INVALID_ARGS;
    }
    free(metaState->name); // Free the old machine name. Guaranteed heap mem.
    int len = (int)strlen(name) + 1;
    metaState->name = (char *)malloc(sizeof(char) *  len);
    if (metaState->name == NULL)
    {
        return REFL_UNKNOWN_ERROR;
    }
    else
    {
        return refl_strcpy(metaState->name, name, len);
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
