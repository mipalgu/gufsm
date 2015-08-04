#include "API_MetaMachine.h"
#include "API_MetaMachine_Internal.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

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

CLReflectResult refl_setMetaMachineName(refl_metaMachine machine, char* name)
{

    if (!machine || !name)
    {
        return API_INVALID_ARGS;
    }
    free(machine->name); // Free the old machine name. Guaranteed heap mem.
    int len = strlen(name);
    machine->name = (char *)malloc(sizeof(char) * len);
    if (machine->name == NULL)
    {
        return API_UNKNOWN_ERROR;
    }
    else
    {
        memcpy(machine->name, name, len);
        return API_SUCCESS;
    }
}

CLReflectResult refl_getMetaMachineName(refl_metaMachine machine, char* buffer, int bufferLen)
{
    if (!machine || !buffer || !machine->name)
    {
        return API_INVALID_ARGS; //name has not been set
    }
    strncpy(buffer, machine->name, bufferLen);
    if (strlen(machine->name) >= bufferLen)
    {
        return API_BUFFER_OVERFLOW;
    }
    else
    {
        return API_SUCCESS;
    }
}
