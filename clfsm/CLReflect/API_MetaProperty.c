#include "API_MetaProperty.h"
#include "API_MetaMachine_Internal.h"
#include <stdlib.h>

refl_metaProperty refl_initMetaProperty(CLReflectResult *result)
{
    refl_metaProperty newMeta = (refl_metaProperty) malloc(sizeof(struct metaProperty_s));
    if (!newMeta)
    {
        if (result)
        {
            *result = REFL_UNKNOWN_ERROR;
        }
    }
    else
    {
        newMeta->name = NULL;
        newMeta->type = NULL;
        newMeta->data = NULL;
        newMeta->getAsString = NULL;
        newMeta->setAsString = NULL;
        newMeta->setAsVoid = NULL;
        newMeta->getAsVoid = NULL;
        if (result)
        {
            *result = REFL_SUCCESS;
        }
    }
    return newMeta;

}

void refl_destroyMetaProperty(refl_metaProperty metaProperty, CLReflectResult *result)
{
    if (!metaProperty)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
    }
    else
    {
        free(metaProperty->name);
        free(metaProperty->type);
        free(metaProperty);
    }
}


void refl_setMetaPropertyStringFunctions(refl_metaProperty metaProperty,
        refl_getValueAsString_f getter, refl_setValueAsString_f setter, CLReflectResult* result)
{
    if (!metaProperty)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
    }
    else
    {
        metaProperty->getAsString = getter;
        metaProperty->setAsString = setter;
        if (result)
        {
            *result = REFL_SUCCESS;
        }
    }

}

void refl_setMetaPropertyVoidFunctions(refl_metaProperty metaProperty,
        refl_getValueAsVoid_f getter, refl_setValueAsVoid_f setter, CLReflectResult* result)
{
    if (!metaProperty)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
    }
    else
    {
        metaProperty->getAsVoid = getter;
        metaProperty->setAsVoid = setter;
        if (result)
        {
            *result = REFL_SUCCESS;
        }
    }

}
