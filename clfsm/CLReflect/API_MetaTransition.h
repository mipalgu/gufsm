#ifndef API_METATRANSITION_H
#define API_METATRANSITION_H

#include "API_MetaMachine_Internal.h"

struct metaTransition_s;
typedef struct metaTransition_s* refl_metaTransition;

//! Inits the metaTransition
refl_metaTransition refl_initMetaTransition(int* result);

//! Destroys the metaTransition
void refl_destroyMetaTransition(refl_metaTransition trans, int* result);

#endif /* end of include guard: API_METATRANSITION_H */
