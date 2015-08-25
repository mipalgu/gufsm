#ifndef API_METAMACHINE_PROPERTIES_H
#define API_METAMACHINE_PROPERTIES_H

#include "API_MetaMachine.h"


void refl_setMachineMetaProperties(refl_metaMachine metaMachine, refl_metaProperty *properties, unsigned int len, CLReflectResult *result);

refl_metaProperty * refl_getMachineMetaProperties(refl_metaMachine metaMachine, CLReflectResult* result);

unsigned int refl_getNumberOfMachineProperties(refl_metaMachine metaMachine, CLReflectResult *result);

void refl_setMachinePropertyValue_VP(refl_metaMachine metaMachine, unsigned int propIndex, void* value, CLReflectResult *result);


#endif /* end of include guard: API_METAMACHINE_PROPERTIES_H */
