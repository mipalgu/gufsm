#ifndef API_METAMACHINE_INTERNAL_H
#define API_METAMACHINE_INTERNAL_H

#include <stdint.h>

#include "CLReflectFunctionPointerTypes.h"
#include "API_MetaState.h"

struct metaAction_s
{
    refl_stateAction_f action;
    refl_userData_t data;
};

struct metaTransition_s
{
    char *expression;
    uint32_t target;
    uint32_t source;
    refl_transitionEval_f evalFunction;
    refl_userData_t data;
};

struct metaState_s
{
    char* name;
    refl_metaAction onEntry;
    refl_metaAction internal;
    refl_metaAction onExit;
};

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpadded"

struct metaMachine_s
{
    char* name;
    refl_machine_t machine;
    refl_metaState *metaStates;
    int numberOfStates;
};

#pragma clang diagnostic pop



#endif /* end of include guard: API_METAMACHINE_INTERNAL_H */
