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
        return API_SUCCESS;
    }
    else
    {
        return API_UNKNOWN_ERROR;
    }
}

//! Destroys the meta action
CLReflectResult refl_destroyMetaAction(refl_metaAction metaAction)
{
    free(metaAction);
    return API_SUCCESS;
}
