#include "API_MetaMachine_Properties.h"
#include "API_MetaMachine_Internal.h"
#include "API_MetaProperty_Access.h"

#include <stdlib.h>
#include <string.h>
#include <stdio.h> //XXX:

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

void refl_setStatePropertyValue_V(refl_metaMachine metaMachine, unsigned int stateIndex,
                                    unsigned int propIndex, void* value, CLReflectResult *result)
{
    if (!metaMachine || !metaMachine->machine || stateIndex >= metaMachine->numberOfStates ||
            propIndex >= metaMachine->metaStates[stateIndex]->numberOfProperties)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
    }
    else
    {
        refl_metaProperty prop = metaMachine->metaStates[stateIndex]->metaProperties[propIndex];
        _refl_setPropertyAsVoid(prop, metaMachine->machine, value, result);
    }
}

void* refl_getStatePropertyValue_V(refl_metaMachine metaMachine, unsigned int stateIndex,
                                        unsigned int propIndex, CLReflectResult* result)
{
    if (!metaMachine || !metaMachine->machine || stateIndex >= metaMachine->numberOfStates ||
            propIndex >= metaMachine->metaStates[stateIndex]->numberOfProperties)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return NULL;
    }
    else
    {

        refl_metaProperty prop = metaMachine->metaStates[stateIndex]->metaProperties[propIndex];
        return _refl_getPropertyAsVoid(prop, metaMachine->machine, result);
    }
}

void refl_setMachinePropertyValue_S(refl_metaMachine metaMachine, unsigned int propIndex,
                                        char * value, CLReflectResult *result)
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
        _refl_setPropertyAsString(metaMachine->metaProperties[propIndex],
                    metaMachine->machine, value, result);
    }
}

char * refl_getMachinePropertyValue_S(refl_metaMachine metaMachine, unsigned int propIndex,
                                        char *buffer, unsigned int bufferLen,
                                        CLReflectResult* result)
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
        return _refl_getPropertyAsString(metaMachine->metaProperties[propIndex],
                    metaMachine->machine, buffer, bufferLen, result);
    }
}


void refl_setStatePropertyValue_S(refl_metaMachine metaMachine, unsigned int stateIndex,
                                    unsigned int propIndex, char * value, CLReflectResult *result)
{
    if (!metaMachine || !metaMachine->machine || stateIndex >= metaMachine->numberOfStates ||
            propIndex >= metaMachine->metaStates[stateIndex]->numberOfProperties)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
    }
    else
    {
        refl_metaProperty prop = metaMachine->metaStates[stateIndex]->metaProperties[propIndex];
        _refl_setPropertyAsString(prop, metaMachine->machine, value, result);
    }
}

char * refl_getStatePropertyValue_S(refl_metaMachine metaMachine, unsigned int stateIndex,
                                        unsigned int propIndex, char *buffer,
                                        unsigned int bufferLen,CLReflectResult* result)
{
    if (!metaMachine || !metaMachine->machine || stateIndex >= metaMachine->numberOfStates ||
            propIndex >= metaMachine->metaStates[stateIndex]->numberOfProperties)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return NULL;
    }
    else
    {

        refl_metaProperty prop = metaMachine->metaStates[stateIndex]->metaProperties[propIndex];
        return _refl_getPropertyAsString(prop, metaMachine->machine, buffer, bufferLen, result);
    }
}
