#include "API_MetaState.h"

#include <stdlib.h>

struct metaState_s
{
    char* name;
};

//! Initialises the meta state
CLReflectResult refl_initMetaState(refl_metaState *metaState)
{
    refl_metaState newMetaState = (refl_metaState)malloc(sizeof(struct metaState_s));
    if (newMetaState != NULL)
    {
        newMetaState->name = NULL;
        *metaState = newMetaState;
        return API_SUCCESS;
    }
    else
    {
        return API_UNKNOWN_ERROR;
    }
}

//! Destroys the meta-state
/*
CLReflectResult refl_destroyMetaState(refl_metaState metaState)
{
    metaState;
    return API_SUCCESS;
}
*/
