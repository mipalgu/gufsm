#ifndef API_METASTATE
#define API_METASTATE

#include "API_Result.h"
#include "API_MetaAction.h"

struct metaState_s;
typedef struct metaState_s* refl_metaState;

//! Initialises the meta state
CLReflectResult refl_initMetaState(refl_metaState *metaState);

//! Destroys the meta-state
CLReflectResult refl_destroyMetaState(refl_metaState metaState);

//! Sets the state name
CLReflectResult refl_setMetaStateName(refl_metaState metaState, char* name);

//! Gets the state name
CLReflectResult refl_getMetaStateName(refl_metaState metaState, char* buffer, int bufferLen);

//! Sets the OnEntry function
CLReflectResult refl_setOnEntry(refl_metaState metaState, refl_metaAction action);

CLReflectResult refl_setInternal(refl_metaState metaState, refl_metaAction action);

CLReflectResult refl_setOnExit(refl_metaState metaState, refl_metaAction action);

#endif /* end of include guard: API_METASTATE */
