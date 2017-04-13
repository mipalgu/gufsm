/*!
    @file API_Interface.h
*/

#ifndef API_INIT_H
#define API_INIT_H

#include "API_Result.h"
#include "API_MetaMachine.h"

#ifdef __cplusplus
extern "C"
{
#endif
    /*! Inits the API to allow meta-FSM registration. Must be called prior to any registerMachine call.
        @param result The result of the call.
    */
    void refl_initAPI(CLReflectResult *result);

    /*!
        Destroys the API. Do this last.
        @param result The result of the call.
    */
    void refl_destroyAPI(CLReflectResult *result);

    /*!
        Registers the meta machine with the reflection API
        @param metaMachine The meta-FSM being registered
        @param machineID The ID of the meta-FSM's referent FSM.
        @param result The result of the call.
    */
    void refl_registerMetaMachine(refl_metaMachine metaMachine, unsigned int machineID, CLReflectResult *result);

    /*!
        Gets the meta machine with the given ID
        @param machineID The ID of the meta-FSM that it was registered with.
        @param result The result of the call.
        @return The meta-machine corresponding to the given ID, else NULL if it doesn't exist.
    */
    refl_metaMachine refl_getMetaMachine(unsigned int machineID, CLReflectResult *result);

#ifdef __cplusplus
}
#endif





#endif /* end of include guard: API_INIT_H */
