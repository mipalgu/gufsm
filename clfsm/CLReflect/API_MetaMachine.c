#include "API_MetaMachine.h"
#include "API_MetaMachine_Internal.h"
#include "API_Util.h"
#include "CLReflectFunctionPointerTypes.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

refl_metaMachine refl_initMetaMachine(CLReflectResult* result)
{
    refl_metaMachine newMeta  = (refl_metaMachine)malloc(sizeof(struct metaMachine_s));
    if (newMeta != NULL)
    {
        newMeta->name = NULL;
        newMeta->machine = NULL;
        newMeta->numberOfStates = 0;
        newMeta->metaStates = NULL;
        newMeta->numberOfProperties = 0;
        newMeta->metaProperties = NULL;
        newMeta->currentState = NULL;
        newMeta->data = NULL;
        if (result != NULL)
        {
            *result = REFL_SUCCESS;
        }
        return newMeta;
    }
    else
    {
        if (result != NULL)
            *result = REFL_UNKNOWN_ERROR;
        return NULL;
    }
}

void refl_destroyMetaMachine(refl_metaMachine metaMachine, CLReflectResult* result)
{
    CLReflectResult functionResult = REFL_SUCCESS;
    if (metaMachine == NULL)
    {
        functionResult = REFL_INVALID_ARGS;
    }
    else
    {
        free(metaMachine->name);
        //Destroy states
        int i;
        for (i = 0; i < metaMachine->numberOfStates; i++)
        {
            refl_destroyMetaState(metaMachine->metaStates[i], &functionResult);
        }
        for (i = 0; i < metaMachine->numberOfProperties; i++)
        {
            refl_destroyMetaProperty(metaMachine->metaProperties[i], NULL);
        }
        if (functionResult == REFL_SUCCESS)
            free(metaMachine);
    }
    if (result != NULL)
        *result = functionResult;
}

void refl_setMetaMachineName(refl_metaMachine machine, char const * name, CLReflectResult* result)
{
    CLReflectResult funcResult;
    if (!machine || !name)
    {
        funcResult = REFL_INVALID_ARGS;
    } else
    {
        free(machine->name); // Free the old machine name. Guaranteed heap mem.
        int len = (int)strlen(name) + 1;
        machine->name = (char *)malloc(sizeof(char) *  len);
        if (machine->name == NULL)
        {
            funcResult = REFL_UNKNOWN_ERROR;
        }
        else
        {
            funcResult = refl_strcpy(machine->name, name, len);
        }

    }
    if (result)
    {
        *result = funcResult;
    }
}

char* refl_getMetaMachineName(refl_metaMachine machine, CLReflectResult* result)
{
    if (!machine || !machine->name)
    {
        if (result)
            *result = REFL_INVALID_ARGS; //name has not been set
        return NULL;
    }
    else
    {
        int bufferLen = (int)strlen(machine->name) + 1;
        char* buffer = (char*)malloc(bufferLen);
        CLReflectResult funcResult = refl_strcpy(buffer, machine->name, bufferLen);
        if (result)
            *result = funcResult;
        return buffer;
    }

}

void refl_setMachine(refl_metaMachine metaMachine, refl_machine_t machine, CLReflectResult *result)
{
    if (!metaMachine || !machine)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        metaMachine->machine = machine;
        if (result)
        {
            *result = REFL_SUCCESS;
        }
    }
}

//! Gets the number of states
unsigned int refl_getNumberOfStates(refl_metaMachine machine, CLReflectResult* result)
{
    if (!machine)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
        return 0;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
        return machine->numberOfStates;

    }
}

//! Sets the meta-machine's states
void refl_setMetaStates(refl_metaMachine machine, refl_metaState* states, int len, CLReflectResult* result)
{
    if (!machine || (!states && len) || (states && !len)) //Can have null states if len = 0
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        if (len != 0)
        {
            free(machine->metaStates);
            machine->metaStates = (refl_metaState*)malloc(sizeof(refl_metaState) * len);
            memcpy(machine->metaStates, states, sizeof(refl_metaState*) * len);
        }
        machine->numberOfStates = len;
        if (result)
            *result = REFL_SUCCESS;

    }
}

refl_metaState * refl_getMetaStates(refl_metaMachine metaMachine, CLReflectResult *result)
{
    if (!metaMachine)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
            return NULL;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
        return metaMachine->metaStates;
    }

}

void refl_invokeOnEntry(refl_metaMachine metaMachine, int stateNum, CLReflectResult* result)
{
    if (!metaMachine || stateNum >= metaMachine->numberOfStates ||
            !metaMachine->metaStates[stateNum] ||
            !metaMachine->metaStates[stateNum]->onEntry)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        refl_machine_t machine = metaMachine->machine;
        refl_metaAction metaAction = metaMachine->metaStates[stateNum]->onEntry;
        metaAction->action(machine, metaAction->data);
        if (result)
            *result = REFL_SUCCESS;
    }
}


void refl_invokeInternal(refl_metaMachine metaMachine, int stateNum, CLReflectResult* result)
{
    if (!metaMachine || stateNum >= metaMachine->numberOfStates ||
            !metaMachine->metaStates[stateNum] ||
            !metaMachine->metaStates[stateNum]->internal)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        refl_machine_t machine = metaMachine->machine;
        refl_metaAction metaAction = metaMachine->metaStates[stateNum]->internal;
        metaAction->action(machine, metaAction->data);
        if (result)
            *result = REFL_SUCCESS;
    }
}

void refl_invokeOnExit(refl_metaMachine metaMachine, int stateNum, CLReflectResult* result)
{
    if (!metaMachine || stateNum >= metaMachine->numberOfStates ||
            !metaMachine->metaStates[stateNum] ||
            !metaMachine->metaStates[stateNum]->onExit)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        refl_machine_t machine = metaMachine->machine;
        refl_metaAction metaAction = metaMachine->metaStates[stateNum]->onExit;
        metaAction->action(machine, metaAction->data);
        if (result)
            *result = REFL_SUCCESS;
    }
}

refl_bool refl_evaluateTransition(refl_metaMachine metaMachine, unsigned int stateNum, unsigned int transitionNum, CLReflectResult *result)
{
    if (!metaMachine)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
        return refl_FALSE;
    }
    unsigned int numStates = metaMachine->numberOfStates;
    if (stateNum >= numStates)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
        return refl_FALSE;
    }
    refl_metaState state = metaMachine->metaStates[stateNum];
    unsigned int numTransitions = state->numberOfTransitions;
    if (transitionNum >= numTransitions)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
        return refl_FALSE;
    }
    refl_metaTransition transition = state->transitions[transitionNum];
    if (result)
        *result = REFL_SUCCESS;
    return transition->evalFunction(metaMachine->machine,
                        transition->data);

}

int refl_getCurrentState(refl_metaMachine metaMachine, CLReflectResult* result)
{
    if (!metaMachine || !metaMachine->currentState || !metaMachine->machine)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return -1;
    }
    else
    {
        int currentState = metaMachine->currentState(metaMachine->machine,
                                            metaMachine->data);
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        return currentState;
    }
}

void refl_setCurrentStateFunction(refl_metaMachine metaMachine, refl_getCurrentState_f function, refl_userData_t data, CLReflectResult* result)
{
    if (!metaMachine || !function)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
    }
    else
    {
        metaMachine->currentState = function;
        metaMachine->data = data;
        if (result)
        {
            *result = REFL_SUCCESS;
        }
    }
}
