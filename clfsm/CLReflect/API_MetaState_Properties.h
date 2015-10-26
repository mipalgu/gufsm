/*!
    @file API_MetaState_Properties.h
*/

#ifndef API_METASTATE_H
#define API_METASTATE_H

#include "API_MetaState.h"
#include "API_MetaProperty.h"

void refl_setStateMetaProperties(refl_metaState metaState, refl_metaProperty *properties,
                                    unsigned int len, CLReflectResult *result);

refl_metaProperty * refl_getStateMetaProperties(refl_metaState metaState,
                                                    CLReflectResult *result);

unsigned int refl_getNumberOfStateProperties(refl_metaState metaState,
                                                CLReflectResult *result);



#endif /* end of include guard: API_METASTATE_H */
