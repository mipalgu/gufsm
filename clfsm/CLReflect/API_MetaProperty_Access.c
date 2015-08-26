#include "API_MetaProperty_Access.h"
#include "API_MetaMachine_Internal.h"

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
                                void* value, CLReflectResult* result)
{
    if (!property || !property->setAsVoid || !machine)
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
        property->setAsVoid(machine, property->data, value);
    }
}
