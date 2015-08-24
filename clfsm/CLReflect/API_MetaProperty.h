#ifndef API_METAPROPERTY_H
#define API_METAPROPERTY_H

#include <stdlib.h>

#include "API_Result.h"
#include "CLReflectFunctionPointerTypes.h"

struct metaProperty_s;
typedef struct metaProperty_s* refl_metaProperty;

refl_metaProperty refl_initMetaProperty(CLReflectResult *result);

void refl_destroyMetaProperty(refl_metaProperty metaProperty, CLReflectResult *result);

void refl_setMetaPropertyName(refl_metaProperty metaProperty, char const * name, CLReflectResult* result);

char const * refl_getMetaPropertyName(refl_metaProperty metaProperty, CLReflectResult* result);

void refl_setMetaPropertyType(refl_metaProperty metaProperty, char const * type, CLReflectResult* result);

char const * refl_getMetaPropertyType(refl_metaProperty metaProperty, CLReflectResult* result);

void refl_setMetaPropertyData(refl_metaProperty metaProperty, refl_userData_t data, CLReflectResult *result);

void refl_setMetaPropertyStringFunctions(refl_metaProperty metaProperty,
        refl_getValueAsString_f getter, refl_setValueAsString_f setter, CLReflectResult* result);

void refl_setMetaPropertyVoidFunctions(refl_metaProperty metaProperty,
        refl_getValueAsVoid_f getter, refl_setValueAsVoid_f setter, CLReflectResult* result);
#endif /* end of include guard: API_METAPROPERTY_H */
