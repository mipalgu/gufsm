#ifndef API_METAACTION_H
#define API_METAACTION_H

#include "API_Result.h"

struct metaAction_s;
typedef struct metaAction_s* refl_metaAction;

//! Inits the meta-action
CLReflectResult refl_initMetaAction(refl_metaAction *metaAction);

//! Destroys the meta action
CLReflectResult refl_destroyMetaAction(refl_metaAction metaAction);

#endif /* end of include guard: API_METAACTION_H */
