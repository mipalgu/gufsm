#include "API_MetaTransition.h"

#include <stdlib.h>
#include <string.h>

#include "API_Util.h"
#include "API_MetaMachine_Internal.h"

refl_metaTransition refl_initMetaTransition(CLReflectResult* result)
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

void refl_destroyMetaTransition(refl_metaTransition trans, CLReflectResult* result)
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

int refl_getMetaTransitionTarget(refl_metaTransition trans, CLReflectResult* result)
{
    int errorReturnVal = -1;
    if (trans == NULL)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return errorReturnVal;
    }
    else
    {
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        return trans->target;
    }
}

void refl_setMetaTransitionTarget(refl_metaTransition trans, unsigned int target, CLReflectResult* result)
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
        trans->target = target;
        if (result)
        {
            *result = REFL_SUCCESS;
        }
    }
}

int refl_getMetaTransitionSource(refl_metaTransition trans, CLReflectResult* result)
{
    int errorReturnVal = -1;
    if (trans == NULL)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return errorReturnVal;
    }
    else
    {
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        return trans->source;
    }
}

void refl_setMetaTransitionSource(refl_metaTransition trans, unsigned int source, CLReflectResult* result)
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
        trans->source = source;
        if (result)
        {
            *result = REFL_SUCCESS;
        }
    }
}

refl_transitionEval_f refl_getMetaTransitionEvalFunction(refl_metaTransition trans, CLReflectResult* result)
{
    if (trans == NULL)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return NULL;
    }
    else
    {
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        return trans->evalFunction;
    }
}

void refl_setMetaTransitionEvalFunction(refl_metaTransition trans, refl_transitionEval_f func, refl_userData_t data, CLReflectResult* result)
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
        trans->evalFunction = func;
        trans->data = data;
        if (result)
        {
            *result = REFL_SUCCESS;
        }
    }
}

refl_userData_t refl_getMetaTransitionData(refl_metaTransition trans, CLReflectResult* result)
{
    if (trans == NULL)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return NULL;
    }
    else
    {
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        return trans->data;
    }
}

const char * refl_getMetaTransitionExpression(refl_metaTransition trans, CLReflectResult* result)
{
    if (!trans)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
        return NULL;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
        return trans->expression;
    }

}

void refl_setMetaTransitionExpression(refl_metaTransition trans, char const * expression, CLReflectResult* result)
{
    if (!trans || !expression)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        free(trans->expression);
        size_t len = strlen(expression) + 1;
        trans->expression = (char *) malloc(sizeof(char) * len);
        if (!trans->expression)
        {
            if (result)
                *result = REFL_UNKNOWN_ERROR;
        }
        else
        {
            CLReflectResult res = refl_strcpy(trans->expression, expression, len);
            if (result)
                *result = res;
        }

    }
}
