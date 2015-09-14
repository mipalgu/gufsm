#pragma clang diagnostic ignored "-Wunused-parameter"

#include "CPingPong.h"
#include "CLReflectAPI.h"

// Create meta machine method
refl_metaMachine Create_MetaMachine();

// State actions
void meta_initial_OnEntry(refl_machine_t machine, refl_userData_t data);
void meta_ping_OnEntry(refl_machine_t machine, refl_userData_t data);
void meta_pong_OnEntry(refl_machine_t machine, refl_userData_t data);

void meta_initial_OnEntry(refl_machine_t machine, refl_userData_t data)
{
    initial_OnEntry();
}
void meta_ping_OnEntry(refl_machine_t machine, refl_userData_t data)
{
    ping_OnEntry();
}
void meta_pong_OnEntry(refl_machine_t machine, refl_userData_t data)
{
    pong_OnEntry();
}

// Transitions
refl_bool meta_initial_transition0(refl_machine_t machine, refl_userData_t data);
refl_bool meta_ping_transition0(refl_machine_t machine, refl_userData_t data);
refl_bool meta_ping_transition1(refl_machine_t machine, refl_userData_t data);
refl_bool meta_pong_transition0(refl_machine_t machine, refl_userData_t data);

refl_bool meta_initial_transition0(refl_machine_t machine, refl_userData_t data)
{
    return refl_TRUE;
}
refl_bool meta_ping_transition0(refl_machine_t machine, refl_userData_t data)
{
    return (ping_transition0()) ? refl_TRUE : refl_FALSE;

}
refl_bool meta_ping_transition1(refl_machine_t machine, refl_userData_t data)
{
    return (ping_transition1()) ? refl_TRUE : refl_FALSE;
}
refl_bool meta_pong_transition0(refl_machine_t machine, refl_userData_t data)
{
    return (pong_transition0()) ? refl_TRUE : refl_FALSE;
}

refl_metaMachine Create_MetaMachine()
{
    refl_metaMachine m = refl_initMetaMachine(NULL);

    // States
    refl_metaState states[4];
    // Initial
    refl_metaState initial = refl_initMetaState(NULL);
    states[0] = initial;
    refl_metaAction ma_initial_OnEntry = refl_initMetaAction(NULL);
    refl_setMetaActionMethod(ma_initial_OnEntry, meta_initial_OnEntry, NULL);
    refl_setOnEntry(initial, ma_initial_OnEntry, NULL);
    refl_metaTransition initial_t0 = refl_initMetaTransition(NULL);
    refl_setMetaTransitionEvalFunction(initial_t0, meta_initial_transition0, NULL, NULL);
    refl_setMetaTransitionSource(initial_t0, 0, NULL);
    refl_setMetaTransitionTarget(initial_t0, 1, NULL);
    refl_setMetaTransitionExpression(initial_t0, "true", NULL);
    refl_setMetaTransitions(initial, &initial_t0, 1, NULL);

    // Ping
    refl_metaState ping = refl_initMetaState(NULL);
    states[1] = ping;
    refl_metaAction ma_ping_OnEntry = refl_initMetaAction(NULL);
    refl_setMetaActionMethod(ma_ping_OnEntry, meta_ping_OnEntry, NULL);
    refl_setOnEntry(ping, ma_ping_OnEntry, NULL);
    refl_metaTransition ping_t0 = refl_initMetaTransition(NULL);
    refl_setMetaTransitionEvalFunction(ping_t0, meta_ping_transition0, NULL, NULL);
    refl_setMetaTransitionSource(ping_t0, 1, NULL);
    refl_setMetaTransitionTarget(ping_t0, 2, NULL);
    refl_setMetaTransitionExpression(ping_t0, "counter < 5", NULL);
    refl_metaTransition ping_t1 = refl_initMetaTransition(NULL);
    refl_setMetaTransitionEvalFunction(ping_t1, meta_ping_transition1, NULL, NULL);
    refl_setMetaTransitionSource(ping_t1, 1, NULL);
    refl_setMetaTransitionTarget(ping_t1, 3, NULL);
    refl_setMetaTransitionExpression(ping_t1, "counter >= 5", NULL);
    refl_metaTransition pingTransitions[] = { ping_t0, ping_t1 };
    refl_setMetaTransitions(ping, pingTransitions, 2, NULL);

    //Pong
    refl_metaState pong = refl_initMetaState(NULL);
    states[2] = pong;
    refl_metaAction ma_pong_OnEntry = refl_initMetaAction(NULL);
    refl_setMetaActionMethod(ma_pong_OnEntry, meta_pong_OnEntry, NULL);
    refl_setOnEntry(pong, ma_pong_OnEntry, NULL);
    refl_metaTransition pong_t0 = refl_initMetaTransition(NULL);
    refl_setMetaTransitionEvalFunction(pong_t0, meta_pong_transition0, NULL, NULL);
    refl_setMetaTransitionSource(pong_t0, 2, NULL);
    refl_setMetaTransitionTarget(pong_t0, 1, NULL);
    refl_setMetaTransitionExpression(pong_t0, "true", NULL);
    refl_setMetaTransitions(pong, &pong_t0, 1, NULL);

    // End
    refl_metaState end = refl_initMetaState(NULL);
    states[3] = end;
    refl_setMetaStates(m, states, 4, NULL);


    return m;
}

#pragma clang diagnostic pop
