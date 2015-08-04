#include "API_Init.h"

#include <stdlib.h>

CLReflectResult reflect_initAPI(getMachine_f machineGetter)
{
    if (machineGetter == NULL)
    {
        return REFL_INVALID_ARGS;
    }
    getMachine = machineGetter;
    return REFL_SUCCESS;
}
