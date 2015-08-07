#ifndef API_INIT_H
#define API_INIT_H

#include "API_Result.h"
#include "API_MetaMachine.h"

//! Registers the meta machine with the reflection API
CLReflectResult refl_registerMetaMachine(refl_metaMachine metaMachine, int machineID);

CLReflectResult refl_getMetaMachine(int machineID, refl_metaMachine* metaMachine);

#endif /* end of include guard: API_INIT_H */
