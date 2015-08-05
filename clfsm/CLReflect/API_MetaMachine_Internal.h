#ifndef API_METAMACHINE_INTERNAL_H
#define API_METAMACHINE_INTERNAL_H

#include "CLReflectFunctionPointerTypes.h"


struct metaMachine_s
{
    char* name;
};

struct metaState_s
{
    char* name;
};

struct metaAction_s
{
    refl_stateAction_f action;
    refl_userData_t data;
};

#endif /* end of include guard: API_METAMACHINE_INTERNAL_H */
