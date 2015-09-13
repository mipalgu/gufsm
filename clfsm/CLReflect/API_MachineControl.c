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
