#ifndef API_METAACTION_H
#define API_METAACTION_H

#include "API_Result.h"
#include "CLReflectFunctionPointerTypes.h"

struct metaAction_s;
typedef struct metaAction_s* refl_metaAction;

//! Inits the meta-action
CLReflectResult refl_initMetaAction(refl_metaAction *metaAction);

//! Destroys the meta action
CLReflectResult refl_destroyMetaAction(refl_metaAction metaAction);

//! Gets the action function pointer
CLReflectResult refl_getMetaActionMethod(refl_metaAction metaAction, refl_stateAction_f* method);

//! Sets the action function pointer
CLReflectResult refl_setMetaActionMethod(refl_metaAction metaAction, refl_stateAction_f method);

#endif /* end of include guard: API_METAACTION_H */
