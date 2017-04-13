/*!
    @file API_MetaState_Properties.h
*/

#ifndef API_METASTATE_H
#define API_METASTATE_H

#include "API_MetaState.h"
#include "API_MetaProperty.h"

/*!
    Sets the meta-state's meta-properties.
    @param metaState The meta-state.
    @param properties An array of meta-properties.
    @param len The length of the \p properties.
    @param result The result of the call.
*/
void refl_setStateMetaProperties(refl_metaState metaState, refl_metaProperty *properties,
                                    unsigned int len, CLReflectResult *result);

/*!
    Gets the meta-state's meta-properties.
    @param metaState The meta-state.
    @param result The result of the call.
*/
refl_metaProperty * refl_getStateMetaProperties(refl_metaState metaState,
                                                    CLReflectResult *result);

/*!
    Gets the length of the meta-state's meta-properties array.
    @param metaState The meta-state.
    @param result The result of the call.
    @return The length of the meta-state's meta-properties array.
*/
unsigned int refl_getNumberOfStateProperties(refl_metaState metaState,
                                                CLReflectResult *result);



#endif /* end of include guard: API_METASTATE_H */
