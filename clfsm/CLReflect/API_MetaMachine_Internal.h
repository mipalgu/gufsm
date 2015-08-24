#ifndef API_METAMACHINE_INTERNAL_H
#define API_METAMACHINE_INTERNAL_H

#include <stdint.h>

#include "CLReflectFunctionPointerTypes.h"
#include "API_MetaState.h"
#include "API_MetaTransition.h"

struct metaAction_s
{
    refl_stateAction_f action;
    refl_userData_t data;
};

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpadded"

struct metaTransition_s
{
    char *expression;
    unsigned int target;
    unsigned int source;
    refl_transitionEval_f evalFunction;
    refl_userData_t data;
};

struct metaState_s
{
    char* name;
    unsigned int numberOfTransitions;
    refl_metaTransition* transitions;
    refl_metaAction onEntry;
    refl_metaAction internal;
    refl_metaAction onExit;
};



struct metaMachine_s
{
    char* name;
    refl_machine_t machine;
    refl_metaState *metaStates;
    int numberOfStates;
    refl_getCurrentState_f currentState;
    refl_userData_t data;
};

#pragma clang diagnostic pop



#endif /* end of include guard: API_METAMACHINE_INTERNAL_H */
