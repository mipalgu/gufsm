#ifndef API_METASTATE
#define API_METASTATE

#include "API_Result.h"
#include "API_MetaAction.h"

struct metaState_s;
typedef struct metaState_s* refl_metaState;

//! Initialises the meta state
refl_metaState refl_initMetaState(CLReflectResult *result);

//! Destroys the meta-state
void refl_destroyMetaState(refl_metaState metaState, CLReflectResult* result);

//! Sets the state name
void refl_setMetaStateName(refl_metaState metaState, char const * name, CLReflectResult* result);

//! Gets the state name. Caller responsible for freeing pointer.
char* refl_getMetaStateName(refl_metaState metaState, CLReflectResult *result);

//! Sets the OnEntry function
void refl_setOnEntry(refl_metaState metaState, refl_metaAction action, CLReflectResult *result);

void refl_setInternal(refl_metaState metaState, refl_metaAction action, CLReflectResult *result);

void refl_setOnExit(refl_metaState metaState, refl_metaAction action, CLReflectResult *result);

#endif /* end of include guard: API_METASTATE */
