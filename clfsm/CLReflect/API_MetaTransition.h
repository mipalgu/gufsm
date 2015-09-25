#ifndef API_METATRANSITION_H
#define API_METATRANSITION_H

#include "API_Result.h"
#include "CLReflectFunctionPointerTypes.h"

struct metaTransition_s;
typedef struct metaTransition_s* refl_metaTransition;

//! Inits the metaTransition
refl_metaTransition refl_initMetaTransition(CLReflectResult* result);

//! Destroys the metaTransition
void refl_destroyMetaTransition(refl_metaTransition trans, CLReflectResult* result);

int refl_getMetaTransitionTarget(refl_metaTransition trans, CLReflectResult* result);

void refl_setMetaTransitionTarget(refl_metaTransition trans, unsigned int target, CLReflectResult* result);

int refl_getMetaTransitionSource(refl_metaTransition trans, CLReflectResult* result);

void refl_setMetaTransitionSource(refl_metaTransition trans, unsigned int source, CLReflectResult* result);

refl_transitionEval_f refl_getMetaTransitionEvalFunction(refl_metaTransition trans, CLReflectResult* result);

void refl_setMetaTransitionEvalFunction(refl_metaTransition trans, refl_transitionEval_f func, refl_userData_t data, CLReflectResult* result);

refl_userData_t refl_getMetaTransitionData(refl_metaTransition trans, CLReflectResult* result);

const char * refl_getMetaTransitionExpression(refl_metaTransition trans, CLReflectResult* result);

void refl_setMetaTransitionExpression(refl_metaTransition trans, char const * exp, CLReflectResult* result);

#endif /* end of include guard: API_METATRANSITION_H */
