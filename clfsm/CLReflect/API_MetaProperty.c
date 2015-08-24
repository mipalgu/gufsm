#include "API_MetaProperty.h"
#include "API_MetaMachine_Internal.h"
#include "API_Util.h"
#include <stdlib.h>
#include <string.h>

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

void refl_setMetaPropertyData(refl_metaProperty metaProperty, refl_userData_t data, CLReflectResult *result)
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
        metaProperty->data = data;
        if (result)
        {
            *result = REFL_SUCCESS;
        }
    }
}

void refl_setMetaPropertyName(refl_metaProperty metaProperty, char const * name, CLReflectResult* result)
{
    CLReflectResult funcResult;
    if (!metaProperty || !name)
    {
        funcResult = REFL_INVALID_ARGS;
    } else
    {
        free(metaProperty->name); // Free the old machine name. Guaranteed heap mem.
        int len = (int)strlen(name) + 1;
        metaProperty->name = (char *)malloc(sizeof(char) *  len);
        if (metaProperty->name == NULL)
        {
            funcResult = REFL_UNKNOWN_ERROR;
        }
        else
        {
            funcResult = refl_strcpy(metaProperty->name, name, len);
        }

    }
    if (result)
    {
        *result = funcResult;
    }
}

char const * refl_getMetaPropertyName(refl_metaProperty metaProperty, CLReflectResult* result)
{
    if (!metaProperty)
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
        return metaProperty->name;
    }
}

void refl_setMetaPropertyType(refl_metaProperty metaProperty, char const * type, CLReflectResult* result)
{
    CLReflectResult funcResult;
    if (!metaProperty || !type)
    {
        funcResult = REFL_INVALID_ARGS;
    } else
    {
        free(metaProperty->type); // Free the old machine name. Guaranteed heap mem.
        int len = (int)strlen(type) + 1;
        metaProperty->type = (char *)malloc(sizeof(char) *  len);
        if (metaProperty->type == NULL)
        {
            funcResult = REFL_UNKNOWN_ERROR;
        }
        else
        {
            funcResult = refl_strcpy(metaProperty->type, type, len);
        }

    }
    if (result)
    {
        *result = funcResult;
    }
}

char const * refl_getMetaPropertyType(refl_metaProperty metaProperty, CLReflectResult* result)
{
    if (!metaProperty)
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
        return metaProperty->type;
    }
}
