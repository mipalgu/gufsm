#include "CLReflectAPI.h"

extern "C"
{
    refl_metaMachine Create_MetaMachine();
}

void methodInvocation_onEntry(refl_machine_t machine, refl_userData_t data);

refl_metaMachine Create_MetaMachine()
{
    refl_metaMachine m;
    refl_initMetaMachine(&m);
    refl_setMetaMachineName(m, "CLReflectDemo");

    // States
    // State: States
    refl_metaState ms_States;
    refl_initMetaState(&ms_States);
    refl_setMetaStateName(ms_States, "States");

    // State: MethodInvocation
    refl_metaState ms_MethodInvocation;
    refl_initMetaState(&ms_MethodInvocation);
    refl_setMetaStateName(ms_MethodInvocation, "MethodInvocation");

    // Add states to machine
    refl_metaState states[2];
    states[0] = ms_States;
    states[1] = ms_MethodInvocation;

    refl_setMetaStates(m, states, 2);
    return m;
}
