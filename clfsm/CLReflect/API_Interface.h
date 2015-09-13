#ifndef API_INIT_H
#define API_INIT_H

#include "API_Result.h"
#include "API_MetaMachine.h"

#ifdef __cplusplus
extern "C"
{
#endif
    //! Inits the API
    void refl_initAPI(CLReflectResult *result);

    //! De-inits the API
    void refl_destroyAPI(CLReflectResult *result);

    //! Registers the meta machine with the reflection API
    void refl_registerMetaMachine(refl_metaMachine metaMachine, unsigned int machineID, CLReflectResult *result);

    //! Gets the meta machine with the given ID
    refl_metaMachine refl_getMetaMachine(unsigned int machineID, CLReflectResult *result);
#ifdef __cplusplus
}
#endif





#endif /* end of include guard: API_INIT_H */
