#include "API_MetaProperty_Access.h"
#include "API_MetaMachine_Internal.h"

#include <stdio.h> //XXX

void* _refl_getPropertyAsVoid(refl_metaProperty property, refl_machine_t machine,
                                CLReflectResult* result)
{
    if (!property || !property->getAsVoid || !machine)
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
        return property->getAsVoid(machine, property->data);
    }
}

void _refl_setPropertyAsVoid(refl_metaProperty property, refl_machine_t machine,
                                void* value, size_t size, CLReflectResult* result)
{
    if (!value || !property || !property->setAsVoid || !machine)
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
        property->setAsVoid(machine, property->data, value, size);
    }
}

char * _refl_getPropertyAsString(refl_metaProperty property, refl_machine_t machine,
                                char* buffer, unsigned int bufferLen, CLReflectResult *result)
{
    if (!property || !property->getAsString || !machine)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return NULL;
    }
    else
    {
        //If buffer null then allocate memory
        if (!buffer)
        {
            if (bufferLen == 0)
            {
                bufferLen = 100;  //Default amount, as not possible to know
                                // how much will be needed without asking FSM
            }
            buffer = (char *)malloc(sizeof(char) * bufferLen);
        }
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        return property->getAsString(machine, property->data, buffer, bufferLen);
    }
}

void _refl_setPropertyAsString(refl_metaProperty property, refl_machine_t machine,
                                char * value, CLReflectResult* result)
{
    if (!value || !property || !property->setAsString || !machine)
    {
        printf("%s %p %p %p\n", value, property, property->setAsString, machine);
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
        property->setAsString(machine, property->data, value);
    }
}
