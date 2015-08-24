#ifndef API_METAPROPERTY_H
#define API_METAPROPERTY_H

#include "API_Result.h"

struct metaProperty_s;
typedef struct metaProperty_s* refl_metaProperty;

refl_metaProperty refl_initMetaProperty(CLReflectResult *result);

void refl_destroyMetaProperty(refl_metaProperty metaProperty, CLReflectResult *result);

#endif /* end of include guard: API_METAPROPERTY_H */
