#ifndef API_INIT_H
#define API_INIT_H

#include "API_Result.h"
#include "API_MetaMachine.h"

extern "C"
{
    //! Inits the API
    CLReflectResult refl_initAPI();

    //! De-inits the API
    CLReflectResult refl_destroyAPI();

    //! Registers the meta machine with the reflection API
    CLReflectResult refl_registerMetaMachine(refl_metaMachine metaMachine, unsigned int machineID);

    //! Gets the meta machine with the given ID
    CLReflectResult refl_getMetaMachine(unsigned int machineID, refl_metaMachine* metaMachine);


}




#endif /* end of include guard: API_INIT_H */
