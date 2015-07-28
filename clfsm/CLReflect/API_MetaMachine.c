#include "API_MetaMachine.h"

#include <stdlib.h>
#include <stdio.h>

struct metaMachine_s
{
    char* name;
};

CLReflectResult refl_initMetaMachine(refl_metaMachine *metaMachine)
{
    refl_metaMachine newMeta  = (refl_metaMachine)malloc(sizeof(struct metaMachine_s));
    if (newMeta != NULL)
    {
        newMeta->name = NULL;
        *metaMachine = newMeta;
        return API_SUCCESS;
    }
    else
    {
        return API_UNKNOWN_ERROR;
    }
}

CLReflectResult refl_destroyMetaMachine(refl_metaMachine metaMachine)
{
    if (metaMachine == NULL)
    {
        return API_INVALID_ARGS;
    }
    free(metaMachine->name);
    free(metaMachine);
    return API_SUCCESS;
}

// XXX: remove once parameters are actually used
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-parameter"

CLReflectResult refl_setMachineName(refl_metaMachine machine, char* name)
{
    return API_SUCCESS;
}

CLReflectResult refl_getMachineName(refl_metaMachine machine, char* buffer, int bufferLen)
{
    return API_SUCCESS;
}

#pragma clang diagnostic pop
