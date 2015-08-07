#include "API_Interface.h"
#include "CLMetaRegister.h"


static CLMetaRegister* metaRegister;

//! Inits the API
CLReflectResult refl_initAPI()
{
    metaRegister = new CLMetaRegister();
    return REFL_SUCCESS;
}

//! Registers the meta machine with the reflection API
CLReflectResult refl_registerMetaMachine(refl_metaMachine metaMachine, int machineID)
{
    if (!metaMachine || metaRegister->metaRegister.count(machineID) != 0)
    {
        return REFL_INVALID_ARGS;
    }
    metaRegister->metaRegister[machineID] = metaMachine;
    return REFL_SUCCESS;
}

//! Gets the meta machine with the given ID
CLReflectResult refl_getMetaMachine(int machineID, refl_metaMachine* metaMachine);
