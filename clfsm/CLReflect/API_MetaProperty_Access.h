#ifndef API_METAPROPERTY_ACCESS
#define API_METAPROPERTY_ACCESS

#include "API_MetaProperty.h"

void* _refl_getPropertyAsVoid(refl_metaProperty property, refl_machine_t machine,
                                CLReflectResult* result);

void _refl_setPropertyAsVoid(refl_metaProperty property, refl_machine_t machine,
                                void* value, size_t size, CLReflectResult* result);

/*! Gets a string representation of the property
    @param property The meta property.
    @param machine The executing FSM.
    @param result An optional result enum.
    @return A string representation of the property. If buffer is provided, then
            it is returned, otherwise a heap allocated string is returned. The
            caller is responsible for freeing the memory in this case.
*/
char * _refl_getPropertyAsString(refl_metaProperty property, refl_machine_t machine,
                                char* buffer, unsigned int bufferLen, CLReflectResult *result);

void _refl_setPropertyAsString(refl_metaProperty property, refl_machine_t machine,
                                char * value, CLReflectResult* result);

#endif /* end of include guard: API_METAPROPERTY_ACCESS */
