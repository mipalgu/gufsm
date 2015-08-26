#include "API_MetaMachine_Properties.h"
#include "API_MetaMachine_Internal.h"
#include "API_MetaProperty_Access.h"

#include <stdlib.h>
#include <string.h>

void refl_setMachineMetaProperties(refl_metaMachine metaMachine, refl_metaProperty *properties, unsigned int len, CLReflectResult *result)
{
    if (!metaMachine || (!properties && len) || (properties && !len))
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
            free(metaMachine->metaProperties);
            metaMachine->metaProperties = (refl_metaProperty*)malloc(sizeof(refl_metaProperty) * len);
            memcpy(metaMachine->metaProperties, properties, sizeof(refl_metaProperty) * len);
        }
        metaMachine->numberOfProperties = len;
        if (result)
        {
            *result = REFL_SUCCESS;
        }
    }
}

refl_metaProperty * refl_getMachineMetaProperties(refl_metaMachine metaMachine, CLReflectResult* result)
{
    if (!metaMachine)
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
        return metaMachine->metaProperties;
    }
}

unsigned int refl_getNumberOfMachineProperties(refl_metaMachine metaMachine, CLReflectResult *result)
{
    if (!metaMachine)
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
        return metaMachine->numberOfProperties;
    }
}

void refl_setMachinePropertyValue_V(refl_metaMachine metaMachine, unsigned int propIndex, void* value, CLReflectResult *result)
{
    if (!metaMachine || !metaMachine->machine ||
            propIndex >= metaMachine->numberOfProperties)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
    }
    else
    {
        _refl_setPropertyAsVoid(metaMachine->metaProperties[propIndex],
                    metaMachine->machine, value, result);
    }
}

void* refl_getMachinePropertyValue_V(refl_metaMachine metaMachine, unsigned int propIndex, CLReflectResult* result)
{
    if (!metaMachine || !metaMachine->machine ||
            propIndex >= metaMachine->numberOfProperties)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return NULL;
    }
    else
    {
        return _refl_getPropertyAsVoid(metaMachine->metaProperties[propIndex],
                    metaMachine->machine, result);
    }
}
