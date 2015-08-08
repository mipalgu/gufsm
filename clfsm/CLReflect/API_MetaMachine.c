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
        newMeta->machine = NULL;
        newMeta->numberOfStates = 0;
        newMeta->metaStates = NULL;
        *metaMachine = newMeta;
        return REFL_SUCCESS;
    }
    else
    {
        return REFL_UNKNOWN_ERROR;
    }
}

CLReflectResult refl_destroyMetaMachine(refl_metaMachine metaMachine)
{
    if (metaMachine == NULL)
    {
        return REFL_INVALID_ARGS;
    }
    free(metaMachine->name);
    //Destroy states
    int i;
    for (i = 0; i < metaMachine->numberOfStates; i++)
    {
        refl_destroyMetaState(metaMachine->metaStates[i]);
    }
    free(metaMachine);
    return REFL_SUCCESS;
}

CLReflectResult refl_setMetaMachineName(refl_metaMachine machine, char* name)
{

    if (!machine || !name)
    {
        return REFL_INVALID_ARGS;
    }
    free(machine->name); // Free the old machine name. Guaranteed heap mem.
    int len = (int)strlen(name) + 1;
    machine->name = (char *)malloc(sizeof(char) *  len);
    if (machine->name == NULL)
    {
        return REFL_UNKNOWN_ERROR;
    }
    else
    {
        memcpy(machine->name, name, len);
        return REFL_SUCCESS;
    }
}

CLReflectResult refl_getMetaMachineName(refl_metaMachine machine, char* buffer, int bufferLen)
{
    if (!machine || !buffer || !machine->name)
    {
        return REFL_INVALID_ARGS; //name has not been set
    }

    unsigned int stringLength = strlen(machine->name) + 1;
    if ((int)stringLength >= bufferLen)
    {
        return REFL_BUFFER_OVERFLOW;
    }
    else
    {
        memcpy(buffer, machine->name, stringLength);
        return REFL_SUCCESS;
    }
}

CLReflectResult refl_setMachine(refl_metaMachine metaMachine, refl_machine_t machine)
{
    if (!metaMachine || !machine)
    {
        return REFL_INVALID_ARGS;
    }
    metaMachine->machine = machine;
    return REFL_SUCCESS;
}

//! Gets the number of states
CLReflectResult refl_getNumberOfStates(refl_metaMachine machine, int* num)
{
    if (!machine || !num)
    {
        return REFL_INVALID_ARGS;
    }
    *num = machine->numberOfStates;
    return REFL_SUCCESS;
}

//! Sets the meta-machine's states
CLReflectResult refl_setMetaStates(refl_metaMachine machine, refl_metaState* states, int len)
{
    if (!machine || (!states && len) || (states && !len)) //Can have null states if len = 0
    {
        return REFL_INVALID_ARGS;
    }
    machine->metaStates = states;
    machine->numberOfStates = len;
    return REFL_SUCCESS;
}

CLReflectResult refl_invokeOnEntry(refl_metaMachine metaMachine, int stateNum)
{
    // No error checking, needs to be fast
    refl_machine_t machine = metaMachine->machine;
    refl_metaAction metaAction = metaMachine->metaStates[stateNum]->onEntry;
    metaAction->action(machine, metaAction->data);
    return REFL_SUCCESS;
}


CLReflectResult refl_invokeInternal(refl_metaMachine metaMachine, int stateNum)
{
    // No error checking, needs to be fast
    refl_machine_t machine = metaMachine->machine;
    refl_metaAction metaAction = metaMachine->metaStates[stateNum]->internal;
    metaAction->action(machine, metaAction->data);
    return REFL_SUCCESS;
}

CLReflectResult refl_invokeOnExit(refl_metaMachine metaMachine, int stateNum)
{
    // No error checking, needs to be fast
    refl_machine_t machine = metaMachine->machine;
    refl_metaAction metaAction = metaMachine->metaStates[stateNum]->onExit;
    metaAction->action(machine, metaAction->data);
    return REFL_SUCCESS;
}
