#include "API_MetaState.h"
#include "API_MetaAction.h"
#include "API_MetaMachine_Internal.h"
#include <stdlib.h>


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
        free(metaState);
    }    
    return REFL_SUCCESS;
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
