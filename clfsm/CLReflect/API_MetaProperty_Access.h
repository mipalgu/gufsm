#ifndef API_METAPROPERTY_ACCESS
#define API_METAPROPERTY_ACCESS

#include "API_MetaProperty.h"

void* _refl_getPropertyAsVoid(refl_metaProperty property, refl_machine_t machine,
                                CLReflectResult* result);

void _refl_setPropertyAsVoid(refl_metaProperty property, refl_machine_t machine,
                                void* value, CLReflectResult* result);

#endif /* end of include guard: API_METAPROPERTY_ACCESS */
