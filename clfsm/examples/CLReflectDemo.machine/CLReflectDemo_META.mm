#pragma clang diagnostic ignored "-Wunused-parameter"

#include "CLReflectAPI.h"
#include "CLReflectDemo.h"
#include "State_INITIAL.h"
#include "State_Names.h"
#include "State_States.h"
#include "State_MethodInvocation.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCLReflectDemo;
using namespace State;

extern "C"
{
    refl_metaMachine Create_MetaMachine();
}

// Method declarations
void methodInvocation_onEntry(refl_machine_t machine, refl_userData_t data);
void methodInvocation_internal(refl_machine_t machine, refl_userData_t data);
void methodInvocation_onExit(refl_machine_t machine, refl_userData_t data);

void methodInvocation_onEntry(refl_machine_t machine, refl_userData_t data)
{
    CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
    MethodInvocation* thisState = static_cast<MethodInvocation*>(thisMachine->states()[3]);
    thisState->performOnEntry(thisMachine);
}

void methodInvocation_internal(refl_machine_t machine, refl_userData_t data)
{
    CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
    MethodInvocation* thisState = static_cast<MethodInvocation*>(thisMachine->states()[3]);
    thisState->performInternal(thisMachine);
}

void methodInvocation_onExit(refl_machine_t machine, refl_userData_t data)
{
    CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
    MethodInvocation* thisState = static_cast<MethodInvocation*>(thisMachine->states()[3]);
    thisState->performOnExit(thisMachine);
}

refl_metaMachine Create_MetaMachine()
{
    refl_metaMachine m;
    refl_initMetaMachine(&m);
    refl_setMetaMachineName(m, "CLReflectDemo");

    // States
    //State: Initial
    refl_metaState ms_INITIAL;
    refl_initMetaState(&ms_INITIAL);
    refl_setMetaStateName(ms_INITIAL, "INITIAL");

    //State: Names
    refl_metaState ms_Names;
    refl_initMetaState(&ms_Names);
    refl_setMetaStateName(ms_Names, "Names");

    // State: States
    refl_metaState ms_States;
    refl_initMetaState(&ms_States);
    refl_setMetaStateName(ms_States, "States");

    // State: MethodInvocation
    refl_metaState ms_MethodInvocation;
    refl_initMetaState(&ms_MethodInvocation);
    refl_setMetaStateName(ms_MethodInvocation, "MethodInvocation");
    refl_metaAction ma_MethodInvocation_onEntry, ma_MethodInvocation_internal, ma_MethodInvocation_onExit;
    refl_initMetaAction(&ma_MethodInvocation_onEntry);
    refl_initMetaAction(&ma_MethodInvocation_internal);
    refl_initMetaAction(&ma_MethodInvocation_onExit);

    refl_setMetaActionMethod(ma_MethodInvocation_onEntry, methodInvocation_onEntry);
    refl_setMetaActionMethod(ma_MethodInvocation_internal, methodInvocation_internal);
    refl_setMetaActionMethod(ma_MethodInvocation_onExit, methodInvocation_onExit);

    refl_setOnEntry(ms_MethodInvocation, ma_MethodInvocation_onEntry);
    refl_setInternal(ms_MethodInvocation, ma_MethodInvocation_internal);
    refl_setOnExit(ms_MethodInvocation, ma_MethodInvocation_onExit);


    // Add states to machine
    refl_metaState states[4];
    states[0] = ms_INITIAL;
    states[1] = ms_Names;
    states[2] = ms_States;
    states[3] = ms_MethodInvocation;

    refl_setMetaStates(m, states, 4);
    return m;
}

#pragma clang diagnostic pop
