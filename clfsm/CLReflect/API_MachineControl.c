#include "API_MachineControl.h"


unsigned int refl_getCurrentState(refl_metaMachine metaMachine, CLReflectResult* result)
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
