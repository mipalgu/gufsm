#ifndef API_METAMACHINE_INTERNAL_H
#define API_METAMACHINE_INTERNAL_H

#include "CLReflectFunctionPointerTypes.h"


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
};





#endif /* end of include guard: API_METAMACHINE_INTERNAL_H */
