#ifndef API_METATRANSITION_H
#define API_METATRANSITION_H

#include "API_MetaMachine_Internal.h"

struct metaTransition_s;
typedef struct metaTransition_s* refl_metaTransition;

//! Inits the metaTransition
refl_metaTransition refl_initMetaTransition(uint32_t* result);

//! Destroys the metaTransition
refl_metaTransition refl_destroyMetaTransition(refl_metaTransition trans, uint32_t* result);

#endif /* end of include guard: API_METATRANSITION_H */
