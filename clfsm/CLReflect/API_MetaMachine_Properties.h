/*!
    @file API_MetaMachine_Properties.h
*/

#ifndef API_METAMACHINE_PROPERTIES_H
#define API_METAMACHINE_PROPERTIES_H

#include "API_MetaMachine.h"

/*!
    Sets the machines meta-properties.
    @param metaMachine The meta-FSM.
    @param properties A pointer to an array of properties to be set.
    @param len The length of the property array.
    @param result The result of the call.
*/
void refl_setMachineMetaProperties(refl_metaMachine metaMachine, refl_metaProperty *properties, unsigned int len, CLReflectResult *result);

/*!
    Gets the machine's meta-properties.
    @param metaMachine The meta-FSM.
    @param result The result of the call.
    @return An array of meta-properties
*/
refl_metaProperty * refl_getMachineMetaProperties(refl_metaMachine metaMachine, CLReflectResult* result);

/*!
    Gets the number of meta-properties for the provided meta-FSM.
    @param metaMachine The meta-FSM
    @param result The result of the call.
    @return The number of meta-properties.
*/
unsigned int refl_getNumberOfMachineProperties(refl_metaMachine metaMachine, CLReflectResult *result);


/*!
    Sets the machine property value using a pointer to the value. Property is set by value, not by reference.
    @param metaMachine The meta-FSM.
    @param propIndex The index of the property in the meta-FSM's meta property array.
    @param value A pointer to the value being set.
    @param size The memory size of the value being pointed to e.g. sizeof(int) if setting an int variable
    @param result The result of the call.
*/
void refl_setMachinePropertyValue_V(refl_metaMachine metaMachine, unsigned int propIndex, void* value, size_t size, CLReflectResult *result);

/*!
    Gets a pointer to the property value.
    @param metaMachine The meta-FSM.
    @param propIndex The index of the property in the meta-FSM's meta property array.
    @param result The result of the call.
    @return A pointer to the property's value
*/
void* refl_getMachinePropertyValue_V(refl_metaMachine metaMachine, unsigned int propIndex, CLReflectResult* result);

/*!
    Sets the machine property value using a string representation of the value. The string is decoded, with the result used to set the property value.
    @param metaMachine The meta-FSM.
    @param propIndex The index of the property in the meta-FSM's meta property array.
    @param value A string representation of the value i.e. "45" for setting an int value to 45. from_string() is invoked if it is a whiteboard type.
    @param result The result of the call.
*/
void refl_setMachinePropertyValue_S(refl_metaMachine metaMachine, unsigned int propIndex, char * const value, CLReflectResult *result);

/*!
    Creates a string representation of the value and puts it in the provided buffer. If
    the buffer is NULL then memory will be allocated and the caller will be responsible for freeing the memory.
    @param metaMachine The meta-FSM.
    @param propIndex The index of the property in the meta-FSM's meta property array.
    @param buffer A buffer
    @param bufferLen The length of the buffer.
    @param result The result of the call.
    @return A pointer to the provided buffer, or a pointer to the allocated memory if no buffer was provided.
*/
char * refl_getMachinePropertyValue_S(refl_metaMachine metaMachine, unsigned int propIndex, char *buffer,
                                        unsigned int bufferLen, CLReflectResult* result);

/*!
    Sets the state property value using a pointer to the value. Property is set by value, not by reference.
    @param metaMachine The meta-FSM.
    @param stateIndex The state index in the state array.
    @param propIndex The index of the property in the meta-FSM's meta property array.
    @param value A pointer to the value being set.
    @param size The memory size of the value being pointed to e.g. sizeof(int) if setting an int variable
    @param result The result of the call.
*/
void refl_setStatePropertyValue_V(refl_metaMachine metaMachine, unsigned int stateIndex,
                                    unsigned int propIndex, void* value, size_t size, CLReflectResult *result);

/*!
    Gets a pointer to the property value.
    @param metaMachine The meta-FSM.
    @param stateIndex The state index in the state array.
    @param propIndex The index of the property in the meta-FSM's meta property array.
    @param result The result of the call.
    @return A pointer to the property's value
*/
void* refl_getStatePropertyValue_V(refl_metaMachine metaMachine, unsigned int stateIndex,
                                        unsigned int propIndex, CLReflectResult* result);

/*!
    Sets the machine property value using a string representation of the value. The string is decoded, with the result used to set the property value.
    @param metaMachine The meta-FSM.
    @param propIndex The index of the property in the meta-FSM's meta property array.
    @param stateIndex The state index in the state array.
    @param value A string representation of the value i.e. "45" for setting an int value to 45. from_string() is invoked if it is a whiteboard type.
    @param result The result of the call.
*/
void refl_setStatePropertyValue_S(refl_metaMachine metaMachine, unsigned int stateIndex,
                                    unsigned int propIndex, char * const value, CLReflectResult *result);

/*!
    Creates a string representation of the value and puts it in the provided buffer. If
    the buffer is NULL then memory will be allocated and the caller will be responsible for freeing the memory.
    @param metaMachine The meta-FSM.
    @param stateIndex The state index in the state array.\
    @param propIndex The index of the property in the meta-FSM's meta property array.
    @param buffer A buffer
    @param bufferLen The length of the buffer.
    @param result The result of the call.
    @return A pointer to the provided buffer, or a pointer to the allocated memory if no buffer was provided.
*/
char * refl_getStatePropertyValue_S(refl_metaMachine metaMachine, unsigned int stateIndex,
                                        unsigned int propIndex, char *buffer,
                                        unsigned int bufferLen, CLReflectResult* result);


#endif /* end of include guard: API_METAMACHINE_PROPERTIES_H */
