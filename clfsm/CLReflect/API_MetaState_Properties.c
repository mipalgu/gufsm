#include <string.h>

#include "API_MetaState_Properties.h"
#include "API_MetaMachine_Internal.h"

void refl_setStateMetaProperties(refl_metaState metaState, refl_metaProperty *properties,
                                    unsigned int len, CLReflectResult *result)
{
    if (!metaState || (!properties && len) || (properties && !len))
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
    }
    else
    {
        if (len != 0)
        {
            free(metaState->metaProperties);
            metaState->metaProperties = (refl_metaProperty*)malloc(sizeof(refl_metaProperty) * len);
            memcpy(metaState->metaProperties, properties, sizeof(refl_metaProperty) * len);
        }
        metaState->numberOfProperties = len;
        if (result)
        {
            *result = REFL_SUCCESS;
        }
    }
}

refl_metaProperty * refl_getStateMetaProperties(refl_metaState metaState,
                                                    CLReflectResult *result)
{
    if (!metaState)
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
        return metaState->metaProperties;
    }
}

unsigned int refl_getNumberOfStateProperties(refl_metaState metaState,
                                                CLReflectResult *result)
{
    if (!metaState)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return 0;
    }
    else
    {
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        return metaState->numberOfProperties;
    }
}
