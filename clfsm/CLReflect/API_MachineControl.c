#include "API_MachineControl.h"


unsigned int refl_getCurrentState(refl_metaMachine metaMachine, CLReflectResult* result)
{
    if (!metaMachine || !metaMachine->currentState || !metaMachine->machine)
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
