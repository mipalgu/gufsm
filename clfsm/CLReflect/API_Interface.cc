/*!
    @file API_Interface.cc
*/

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
#pragma clang diagnostic ignored "-Wsign-compare"

#include "API_Interface.h"
#include "CLMetaRegister.h"
#include <stdio.h> //XXX

#include <stdlib.h>

static CLMetaRegister* metaRegister = NULL;

//! Inits the API
void refl_initAPI(CLReflectResult *result)
{
    if (!metaRegister)
    {
        metaRegister = new CLMetaRegister();
    }
    if (result)
        *result = REFL_SUCCESS;
}

void refl_destroyAPI(CLReflectResult *result)
{
    if (!metaRegister)
    {
        if (result)
            *result = REFL_INVALID_CALL;
    }
    else
    {
        delete metaRegister;
        metaRegister = NULL;
        if (result)
            *result = REFL_SUCCESS;
    }

}

//! Registers the meta machine with the reflection API
void refl_registerMetaMachine(refl_metaMachine metaMachine, unsigned int machineID, CLReflectResult *result)
{
    if (!metaMachine || (metaRegister->metaRegister.size() > machineID &&
                metaRegister->metaRegister[machineID] != NULL))
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        //Check capacity and resize if need
        if (machineID > metaRegister->metaRegister.size())
        {
            metaRegister->metaRegister.resize(machineID + 1, NULL);
        }
        metaRegister->metaRegister.insert(metaRegister->metaRegister.begin() + machineID, metaMachine);
        if (result)
            *result = REFL_SUCCESS;
    }

}

//! Gets the meta machine with the given ID
refl_metaMachine refl_getMetaMachine(unsigned int machineID, CLReflectResult *result)
{
    std::vector<refl_metaMachine> metaReg = metaRegister->metaRegister;
    if (machineID >= metaReg.size())
    {
        if (result)
            *result = REFL_INVALID_ARGS;
        return NULL;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
        return metaReg[machineID];
    }

}

#pragma clang diagnostic pop
