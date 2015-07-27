#ifndef API_METAMACHINE_H
#define API_METAMACHINE_H

#include "API_Error.h"

struct metaMachine_s;
typedef struct metaMachine_s* refl_metaMachine;

/*! Initialises and allocates memory for the meta-machine
    @param machine The meta machine.
    @return API_SUCCESS if successful or API_UNKNOWN_ERROR if memory allocation fails.
*/
CLReflectResult refl_initMetaMachine(refl_metaMachine *machine);

/*! Deallocates the meta machine
    @param machine The meta machine.
    @return API_SUCCESS
*/
CLReflectResult refl_destroyMetaMachine(refl_metaMachine machine);

/*! Sets the meta machine name to the given parameter.
    @param machine The meta machine
    @param name The new name.
    @return API_INVALID_ARGS if name is null
            API_UNKNOWN_ERROR if memory allocation for the name fails.
            Otherwise API_SUCCESS
*/
CLReflectResult refl_setMetaMachineName(refl_metaMachine machine, char* name);

/*! Places the metamachineName into the buffer
    @param machine The meta machine
    @param buffer The buffer in which the name will be placed.
    @param bufferLen The length of buffer.
    @return API_INVALID_ARGS if buffer is null
            API_BUFFER_OVERFLOW if the buffer cannot hold the name including terminating character.
            API_SUCCESS otherwise.
*/
CLReflectResult refl_getMetaMachineName(refl_metaMachine machine, char* buffer, int bufferLen);

#endif /* end of include guard: API_METAMACHINE_H */
