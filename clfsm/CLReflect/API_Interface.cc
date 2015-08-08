#pragma clang diagnostic ignored "-Wsign-compare"

#include "API_Interface.h"
#include "CLMetaRegister.h"
#include <stdio.h> //XXX

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

CLReflectResult refl_destroyAPI()
{
    if (!metaRegister)
    {
        return REFL_INVALID_CALL;
    }
    delete metaRegister;
    metaRegister = NULL;
    return REFL_SUCCESS;
}

//! Registers the meta machine with the reflection API
CLReflectResult refl_registerMetaMachine(refl_metaMachine metaMachine, unsigned int machineID)
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
    //Check capacity and resize if need
    if (machineID > metaRegister->metaRegister.size())
    {
        metaRegister->metaRegister.resize(machineID + 1, NULL);
    }
    metaRegister->metaRegister.insert(metaRegister->metaRegister.begin() + machineID, metaMachine);
    return REFL_SUCCESS;
}

//! Gets the meta machine with the given ID
CLReflectResult refl_getMetaMachine(unsigned int machineID, refl_metaMachine* metaMachine)
{
    std::vector<refl_metaMachine> metaReg = metaRegister->metaRegister;
    if (machineID >= metaReg.size())
    {
        return REFL_INVALID_ARGS;
    }
    *metaMachine = metaReg[machineID];
    return REFL_SUCCESS;
}

#pragma clang diagnostic pop
