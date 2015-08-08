#ifndef API_METAMACHINE_H
#define API_METAMACHINE_H

#include "API_Result.h"
#include "API_MetaState.h"

struct metaMachine_s;
typedef struct metaMachine_s* refl_metaMachine;

/*! Initialises and allocates memory for the meta-machine
    @param machine The meta machine.
    @return REFL_SUCCESS if successful or REFL_UNKNOWN_ERROR if memory allocation fails.
*/
CLReflectResult refl_initMetaMachine(refl_metaMachine *machine);

/*! Deallocates the meta machine
    @param machine The meta machine.
    @return REFL_SUCCESS
*/
CLReflectResult refl_destroyMetaMachine(refl_metaMachine machine);

/*! Sets the meta machine name to the given parameter.
    @param machine The meta machine
    @param name The new name.
    @return REFL_INVALID_ARGS if name is null
            REFL_UNKNOWN_ERROR if memory allocation for the name fails.
            Otherwise REFL_SUCCESS
*/
CLReflectResult refl_setMetaMachineName(refl_metaMachine machine, char* name);

/*! Places the metamachine Name into the buffer.
    @param machine The meta machine
    @param buffer The buffer in which the name will be placed.
    @param bufferLen The length of buffer.
    @return REFL_INVALID_ARGS if machine name is null
            REFL_BUFFER_OVERFLOW if the buffer cannot hold the name including terminating character.
            REFL_SUCCESS otherwise.
*/
CLReflectResult refl_getMetaMachineName(refl_metaMachine machine, char* buffer, int bufferLen);

//! Sets the actual machine
CLReflectResult refl_setMachine(refl_metaMachine metaMachine, refl_machine_t machine);

//! Sets the meta-machine's states
CLReflectResult refl_setMetaStates(refl_metaMachine machine, refl_metaState* states, int len);

//! Gets the number of states
CLReflectResult refl_getNumberOfStates(refl_metaMachine machine, int* num);

CLReflectResult refl_getStates(refl_metaMachine, refl_metaState const* stateBuffer);

//! Invokes the OnEntry of a given state
CLReflectResult refl_invokeOnEntry(refl_metaMachine metaMachine, int stateNum);

CLReflectResult refl_invokeInternal(refl_metaMachine metaMachine, int stateNum);

CLReflectResult refl_invokeOnExit(refl_metaMachine metaMachine, int stateNum);


#endif /* end of include guard: API_METAMACHINE_H */
