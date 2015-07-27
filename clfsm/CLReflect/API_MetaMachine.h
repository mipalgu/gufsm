#ifndef API_METAMACHINE_H
#define API_METAMACHINE_H

#include "API_Error.h"

struct metaMachine_s;
typedef struct metaMachine_s* refl_metaMachine;

CLReflectResult refl_initMetaMachine(refl_metaMachine *machine);

CLReflectResult refl_destroyMetaMachine(refl_metaMachine machine);

CLReflectResult refl_setMachineName(refl_metaMachine machine, char* name);

CLReflectResult refl_getMachineName(refl_metaMachine machine, char* buffer, int bufferLen);

#endif /* end of include guard: API_METAMACHINE_H */
