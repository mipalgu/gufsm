#ifndef API_METASTATE
#define API_METASTATE

#include "API_Result.h"

struct metaState_s;
typedef struct metaState_s* refl_metaState;

//! Initialises the meta state
CLReflectResult refl_initMetaState(refl_metaState *metaState);

//! Destroys the meta-state
CLReflectResult refl_destroyMetaState(refl_metaState metaState);

#endif /* end of include guard: API_METASTATE */
