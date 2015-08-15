#include "API_MetaTransition.h"

#include <stdlib.h>

refl_metaTransition refl_initMetaTransition(int* result)
{
    refl_metaTransition transition = (refl_metaTransition)
                                    malloc(sizeof(struct metaTransition_s));
    if (transition == NULL)
    {
        if (result)
        {
            *result = REFL_UNKNOWN_ERROR;
        }
        return NULL;
    }
    else
    {
        transition->expression = NULL;
        transition->evalFunction = NULL;
        transition->data = NULL;
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        return transition;
    }


}

void refl_destroyMetaTransition(refl_metaTransition trans, int* result)
{
    if (trans == NULL)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
    }
    else
    {
        free(trans->expression);
        free(trans);
        if (result)
        {
            *result = REFL_SUCCESS;
        }
    }

}
