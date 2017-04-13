/*!
    @file API_MetaProperty_Access.h
*/

#ifndef API_METAPROPERTY_ACCESS
#define API_METAPROPERTY_ACCESS

#include "API_MetaProperty.h"

/*!
    Sets the machine property value using a pointer to the value. Property is set by value, not by reference.
    @param machine The LLFSM
    @param property The meta-property.
    @param result The result of the call.
    @return A pointer to the property's value.
*/
void* _refl_getPropertyAsVoid(refl_metaProperty property, refl_machine_t machine,
                                CLReflectResult* result);

/*!
    Sets the machine property value using a pointer to the value. Property is set by value, not by reference.
    @param machine The LLFSM
    @param property The meta-property.
    @param value A pointer to the value being set.
    @param size The memory size of the value being pointed to e.g. sizeof(int) if setting an int variable
    @param result The result of the call.
*/
void _refl_setPropertyAsVoid(refl_metaProperty property, refl_machine_t machine,
                                void* value, size_t size, CLReflectResult* result);

/*! Gets a string representation of the property
    @param property The meta property.
    @param machine The executing FSM.
    @param buffer An optional buffer in which to place the string.
    @param bufferLen The length of /p buffer.
    @param result An optional result enum.
    @return A string representation of the property. If buffer is provided, then
            it is returned, otherwise a heap allocated string is returned. The
            caller is responsible for freeing the memory in this case.
*/
char * _refl_getPropertyAsString(refl_metaProperty property, refl_machine_t machine,
                                char* buffer, unsigned int bufferLen, CLReflectResult *result);

/*!
    Sets the machine property value using a string representation of the value. The string is decoded, with the result used to set the property value.
    @param machine The LLFSM
    @param property The meta-property.
    @param value A string representation of the value i.e. "45" for setting an int value to 45. from_string() is invoked if it is a whiteboard type.
    @param result The result of the call.
*/
void _refl_setPropertyAsString(refl_metaProperty property, refl_machine_t machine,
                                char * value, CLReflectResult* result);

#endif /* end of include guard: API_METAPROPERTY_ACCESS */
