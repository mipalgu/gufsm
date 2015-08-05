#ifndef API_METAMACHINE_INTERNAL_H
#define API_METAMACHINE_INTERNAL_H

#include "CLReflectFunctionPointerTypes.h"
#include "API_MetaState.h"

struct metaAction_s
{
    refl_stateAction_f action;
    refl_userData_t data;
};

struct metaState_s
{
    char* name;
    refl_metaAction onEntry;
    refl_metaAction internal;
    refl_metaAction onExit;
};

struct metaMachine_s
{
    char* name;
    int numberOfStates;
    refl_metaState** metaStates;
};





#endif /* end of include guard: API_METAMACHINE_INTERNAL_H */
