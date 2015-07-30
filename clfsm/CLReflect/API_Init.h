#ifndef API_INIT_H
#define API_INIT_H

#include "API_Error.h"
#include "CLReflectFunctionPointerTypes.h"


static getMachine_f getMachine;

//! Initialises the API. Must be done before any further calls
//! @param machineGetter A function pointer that returns machines as void* given their name.
CLReflectResult reflect_initAPI(getMachine_f machineGetter);


#endif /* end of include guard: API_INIT_H */
