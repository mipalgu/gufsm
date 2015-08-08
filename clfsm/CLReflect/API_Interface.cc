#pragma clang diagnostic ignored "-Wsign-compare"

#include "API_Interface.h"
#include "CLMetaRegister.h"

#include <stdlib.h>

static CLMetaRegister* metaRegister = NULL;

//! Inits the API
CLReflectResult refl_initAPI()
{
    if (!metaRegister)
    {
        metaRegister = new CLMetaRegister();
    }
    return REFL_SUCCESS;
}

//! Registers the meta machine with the reflection API
CLReflectResult refl_registerMetaMachine(refl_metaMachine metaMachine, int machineID)
{
    if (!metaMachine)
    {
        return REFL_INVALID_ARGS;
    }
    if (metaRegister->metaRegister.size() > machineID &&
                metaRegister->metaRegister[machineID] != NULL)
    {
        return REFL_INVALID_ARGS;
    }
    metaRegister->metaRegister.insert(metaRegister->metaRegister.begin() + machineID, metaMachine);
    return REFL_SUCCESS;
}

//! Gets the meta machine with the given ID
CLReflectResult refl_getMetaMachine(int machineID, refl_metaMachine* metaMachine);

#pragma clang diagnostic pop
