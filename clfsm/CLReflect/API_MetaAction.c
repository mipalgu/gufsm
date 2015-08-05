#include "API_MetaAction.h"
#include "API_MetaMachine_Internal.h"

#include <stdlib.h>

//! Inits the meta-action
CLReflectResult refl_initMetaAction(refl_metaAction *metaAction)
{
    refl_metaAction newAction = (refl_metaAction)malloc(sizeof(struct metaAction_s));
    if (newAction != NULL)
    {
        newAction->action = NULL;
        newAction->data = NULL;
        *metaAction = newAction;
        return REFL_SUCCESS;
    }
    else
    {
        return REFL_UNKNOWN_ERROR;
    }
}

//! Destroys the meta action
CLReflectResult refl_destroyMetaAction(refl_metaAction metaAction)
{
    free(metaAction);
    return REFL_SUCCESS;
}


//! Gets the action function pointer
CLReflectResult refl_getMetaActionMethod(refl_metaAction metaAction, refl_stateAction_f* method)
{
    if (!metaAction)
    {
        return REFL_INVALID_ARGS;
    }
    *method = metaAction->action;
    return REFL_SUCCESS;
}

//! Sets the action function pointer
CLReflectResult refl_setMetaActionMethod(refl_metaAction metaAction, refl_stateAction_f action)
{
    if (!metaAction || !action)
    {
        return REFL_INVALID_ARGS;
    }
    metaAction->action = action;
    return REFL_SUCCESS;
}

//! Sets the user data
CLReflectResult refl_setMetaActionData(refl_metaAction metaAction, refl_userData_t data)
{
    if (!metaAction)
    {
        return REFL_INVALID_ARGS;
    }
    metaAction->data = data;
    return REFL_SUCCESS;
}

//! Gets the user data
CLReflectResult refl_getMetaActionData(refl_metaAction metaAction, refl_userData_t* data)
{
    if (!metaAction)
    {
        return REFL_INVALID_ARGS;
    }
    *data = metaAction->data;
    return REFL_SUCCESS;
}
