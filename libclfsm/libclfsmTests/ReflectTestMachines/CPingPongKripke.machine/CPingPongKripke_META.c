#pragma clang diagnostic ignored "-Wunused-parameter"

#include "CPingPongKripke.h"
#include "CLReflectAPI.h"
#include <stdlib.h>
#include <stdio.h>

// Create meta machine method
refl_metaMachine Create_MetaMachine(void);

// State actions
void meta_ping_OnEntry(refl_machine_t machine, refl_userData_t data);
void meta_pong_OnEntry(refl_machine_t machine, refl_userData_t data);

void meta_ping_OnEntry(refl_machine_t machine, refl_userData_t data)
{
    ping_OnEntry((CPingPongKripke*)machine);
}
void meta_pong_OnEntry(refl_machine_t machine, refl_userData_t data)
{
    pong_OnEntry((CPingPongKripke*)machine);
}

// Transitions
refl_bool meta_initial_transition0(refl_machine_t machine, refl_userData_t data);
refl_bool meta_ping_transition0(refl_machine_t machine, refl_userData_t data);
refl_bool meta_pong_transition0(refl_machine_t machine, refl_userData_t data);

refl_bool meta_initial_transition0(refl_machine_t machine, refl_userData_t data)
{
    return refl_TRUE;
}
refl_bool meta_ping_transition0(refl_machine_t machine, refl_userData_t data)
{
    return (ping_transition0((CPingPongKripke*)machine)) ? refl_TRUE : refl_FALSE;

}

refl_bool meta_pong_transition0(refl_machine_t machine, refl_userData_t data)
{
    return (pong_transition0((CPingPongKripke*)machine)) ? refl_TRUE : refl_FALSE;
}

/*  Custom destructor call back. Required to delete CPingPong since we are allocating
    it in Create_MetaMachine()
*/
void destroy(refl_machine_t machine, refl_userData_t data);
void destroy(refl_machine_t machine, refl_userData_t data)
{
    printf("Destroying CPingPong\n");
    free(machine);
}

refl_metaMachine Create_MetaMachine()
{
    refl_metaMachine m = refl_initMetaMachine(NULL);
    CPingPongKripke* machine = (CPingPongKripke*)malloc(sizeof(CPingPongKripke));
    refl_setMachine(m, machine, NULL);
    refl_setDestructorAction(m, destroy, NULL);
    // States
    refl_metaState states[2];

    // Ping
    refl_metaState ping = refl_initMetaState(NULL);
    states[0] = ping;
    refl_metaAction ma_ping_OnEntry = refl_initMetaAction(NULL);
    refl_setMetaActionMethod(ma_ping_OnEntry, meta_ping_OnEntry, NULL);
    refl_setOnEntry(ping, ma_ping_OnEntry, NULL);
    refl_metaTransition ping_t0 = refl_initMetaTransition(NULL);
    refl_setMetaTransitionEvalFunction(ping_t0, meta_ping_transition0, NULL, NULL);
    refl_setMetaTransitionSource(ping_t0, 0, NULL);
    refl_setMetaTransitionTarget(ping_t0, 1, NULL);
    refl_setMetaTransitionExpression(ping_t0, "b", NULL);
    refl_setMetaTransitions(ping, &ping_t0, 1, NULL);

    //Pong
    refl_metaState pong = refl_initMetaState(NULL);
    states[1] = pong;
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
    refl_setMetaStates(m, states, 2, NULL);


    return m;
}

#pragma clang diagnostic pop
