#ifndef API_INIT_H
#define API_INIT_H

#include "API_Result.h"
#include "API_MetaMachine.h"

extern "C"
{
    //! Inits the API
    CLReflectResult refl_initAPI();

    //! Registers the meta machine with the reflection API
    CLReflectResult refl_registerMetaMachine(refl_metaMachine metaMachine, int machineID);

    //! Gets the meta machine with the given ID
    CLReflectResult refl_getMetaMachine(int machineID, refl_metaMachine* metaMachine);
}




#endif /* end of include guard: API_INIT_H */
