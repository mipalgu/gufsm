#ifndef API_METAMACHINE_INTERNAL_H
#define API_METAMACHINE_INTERNAL_H



struct metaMachine_s
{
    char* name;
};

struct metaState_s
{
    char* name;
};

typedef void* machine_t;
typedef void* userData_t;
typedef void (*refl_stateAction_f)(void*, void*);

struct metaAction_s
{
    refl_stateAction_f action;
    userData_t data;
};

#endif /* end of include guard: API_METAMACHINE_INTERNAL_H */
