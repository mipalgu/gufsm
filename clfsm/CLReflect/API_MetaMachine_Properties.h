#ifndef API_METAMACHINE_PROPERTIES_H
#define API_METAMACHINE_PROPERTIES_H

#include "API_MetaMachine.h"


void refl_setMachineMetaProperties(refl_metaMachine metaMachine, refl_metaProperty *properties, unsigned int len, CLReflectResult *result);

refl_metaProperty * refl_getMachineMetaProperties(refl_metaMachine metaMachine, CLReflectResult* result);

unsigned int refl_getNumberOfMachineProperties(refl_metaMachine metaMachine, CLReflectResult *result);

void refl_setMachinePropertyValue_V(refl_metaMachine metaMachine, unsigned int propIndex, void* value, CLReflectResult *result);

void* refl_getMachinePropertyValue_V(refl_metaMachine metaMachine, unsigned int propIndex, CLReflectResult* result);

void refl_setMachinePropertyValue_S(refl_metaMachine metaMachine, unsigned int propIndex, char * const value, CLReflectResult *result);

char * refl_getMachinePropertyValue_S(refl_metaMachine metaMachine, unsigned int propIndex, char *buffer,
                                        unsigned int bufferLen, CLReflectResult* result);

// State properties
void refl_setStatePropertyValue_V(refl_metaMachine metaMachine, unsigned int stateIndex,
                                    unsigned int propIndex, void* value, CLReflectResult *result);

void* refl_getStatePropertyValue_V(refl_metaMachine metaMachine, unsigned int stateIndex,
                                        unsigned int propIndex, CLReflectResult* result);

void refl_setStatePropertyValue_S(refl_metaMachine metaMachine, unsigned int stateIndex,
                                    unsigned int propIndex, char * const value, CLReflectResult *result);

char * refl_getStatePropertyValue_S(refl_metaMachine metaMachine, unsigned int stateIndex,
                                        unsigned int propIndex, char *buffer,
                                        unsigned int bufferLen, CLReflectResult* result);


#endif /* end of include guard: API_METAMACHINE_PROPERTIES_H */
