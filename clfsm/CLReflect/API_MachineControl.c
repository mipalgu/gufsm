#include "API_MachineControl.h"


unsigned int refl_getCurrentState(refl_metaMachine metaMachine, CLReflectResult* result)
{
    if (!metaMachine)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return 0;
    }
    else
    {
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        return metaMachine->currentState;
    }
}

void refl_setCurrentState(refl_metaMachine metaMachine, unsigned int stateIndex, CLReflectResult* result)
{
    if (!metaMachine || stateIndex >= metaMachine->numberOfStates)
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
        metaMachine->currentState = stateIndex;
    }
}

int refl_getPreviousState(refl_metaMachine metaMachine, CLReflectResult *result)
{
    if (!metaMachine)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return 0;
    }
    else
    {
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        return metaMachine->previousState;
    }
}

void refl_setPreviousState(refl_metaMachine metaMachine, unsigned int stateIndex, CLReflectResult* result)
{
    if (!metaMachine || stateIndex >= metaMachine->numberOfStates)
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
        metaMachine->previousState = (int)stateIndex;
    }
}

int refl_getSuspendState(refl_metaMachine metaMachine, CLReflectResult *result)
{
    if (!metaMachine)
    {
        if (result)
        {
            *result = REFL_INVALID_ARGS;
        }
        return 0;
    }
    else
    {
        if (result)
        {
            *result = REFL_SUCCESS;
        }
        return metaMachine->suspendState;
    }
}

void refl_setSuspendState(refl_metaMachine metaMachine, unsigned int stateIndex, CLReflectResult* result)
{
    if (!metaMachine || stateIndex >= metaMachine->numberOfStates)
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
        metaMachine->suspendState = (int)stateIndex;
    }
}
