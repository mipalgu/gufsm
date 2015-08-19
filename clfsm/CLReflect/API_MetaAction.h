#ifndef API_METAACTION_H
#define API_METAACTION_H

#include "API_Result.h"
#include "CLReflectFunctionPointerTypes.h"

struct metaAction_s;
typedef struct metaAction_s* refl_metaAction;

//! Inits the meta-action
refl_metaAction refl_initMetaAction(CLReflectResult* result);

//! Destroys the meta action
void refl_destroyMetaAction(refl_metaAction metaAction, CLReflectResult* result);

//! Gets the action function pointer
refl_stateAction_f refl_getMetaActionMethod(refl_metaAction metaAction, CLReflectResult* result);

//! Sets the action function pointer
void refl_setMetaActionMethod(refl_metaAction metaAction, refl_stateAction_f method, CLReflectResult* result);

//! Sets the user data
void refl_setMetaActionData(refl_metaAction metaAction, refl_userData_t data, CLReflectResult* result);

//! Gets the user data
refl_userData_t refl_getMetaActionData(refl_metaAction metaAction, CLReflectResult* result);

#endif /* end of include guard: API_METAACTION_H */
