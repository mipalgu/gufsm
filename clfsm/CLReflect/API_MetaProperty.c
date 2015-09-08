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
        newMeta->type_string = NULL;
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
        free(metaProperty->type_string);
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

void refl_setMetaPropertyType(refl_metaProperty metaProperty, refl_type type, CLReflectResult* result)
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
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        metaProperty->type_enum = type;
    }
}

refl_type refl_getMetaPropertyType(refl_metaProperty metaProperty, CLReflectResult* result)
{
    if (!metaProperty)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return REFL_USERTYPE;
    }
    else
    {
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        return metaProperty->type_enum;
    }
}

void refl_setMetaPropertyTypeString(refl_metaProperty metaProperty, char const * type, CLReflectResult* result)
{
    CLReflectResult funcResult;
    if (!metaProperty || !type)
    {
        funcResult = REFL_INVALID_ARGS;
    } else
    {
        free(metaProperty->type_string); // Free the old machine name. Guaranteed heap mem.
        int len = (int)strlen(type) + 1;
        metaProperty->type_string = (char *)malloc(sizeof(char) *  len);
        if (metaProperty->type_string == NULL)
        {
            funcResult = REFL_UNKNOWN_ERROR;
        }
        else
        {
            funcResult = refl_strcpy(metaProperty->type_string, type, len);
        }

    }
    if (result)
    {
        *result = funcResult;
    }
}

char const * refl_getMetaPropertyTypeAsString(refl_metaProperty metaProperty, CLReflectResult* result)
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
        return metaProperty->type_string;
    }
}

refl_bool refl_isMetaPropertyUnsigned(refl_metaProperty metaProperty, CLReflectResult *result)
{
    if (!metaProperty)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
        return refl_FALSE;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
        return metaProperty->isUnsigned;
    }
}

void refl_setIsMetaPropertyUnsigned(refl_metaProperty metaProperty, refl_bool isUS, CLReflectResult *result)
{
    if (!metaProperty)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
        metaProperty->isUnsigned = isUS;
    }
}
