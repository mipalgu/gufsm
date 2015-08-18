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

// Action Declarations
void INITIAL_OnEntry(refl_machine_t machine, refl_userData_t data);
void INITIAL_Internal(refl_machine_t machine, refl_userData_t data);
void INITIAL_OnExit(refl_machine_t machine, refl_userData_t data);
void Names_OnEntry(refl_machine_t machine, refl_userData_t data);
void Names_Internal(refl_machine_t machine, refl_userData_t data);
void Names_OnExit(refl_machine_t machine, refl_userData_t data);
void States_OnEntry(refl_machine_t machine, refl_userData_t data);
void States_Internal(refl_machine_t machine, refl_userData_t data);
void States_OnExit(refl_machine_t machine, refl_userData_t data);
void MethodInvocation_OnEntry(refl_machine_t machine, refl_userData_t data);
void MethodInvocation_Internal(refl_machine_t machine, refl_userData_t data);
void MethodInvocation_OnExit(refl_machine_t machine, refl_userData_t data);

// Action Implementations
void INITIAL_OnEntry(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	INITIAL* thisState = static_cast<INITIAL*>(thisMachine->states()[0]);
	thisState->performOnEntry(thisMachine);
}
void INITIAL_Internal(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	INITIAL* thisState = static_cast<INITIAL*>(thisMachine->states()[0]);
	thisState->performInternal(thisMachine);
}
void INITIAL_OnExit(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	INITIAL* thisState = static_cast<INITIAL*>(thisMachine->states()[0]);
	thisState->performOnExit(thisMachine);
}
void Names_OnEntry(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	Names* thisState = static_cast<Names*>(thisMachine->states()[1]);
	thisState->performOnEntry(thisMachine);
}
void Names_Internal(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	Names* thisState = static_cast<Names*>(thisMachine->states()[1]);
	thisState->performInternal(thisMachine);
}
void Names_OnExit(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	Names* thisState = static_cast<Names*>(thisMachine->states()[1]);
	thisState->performOnExit(thisMachine);
}
void States_OnEntry(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	States* thisState = static_cast<States*>(thisMachine->states()[2]);
	thisState->performOnEntry(thisMachine);
}
void States_Internal(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	States* thisState = static_cast<States*>(thisMachine->states()[2]);
	thisState->performInternal(thisMachine);
}
void States_OnExit(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	States* thisState = static_cast<States*>(thisMachine->states()[2]);
	thisState->performOnExit(thisMachine);
}
void MethodInvocation_OnEntry(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	MethodInvocation* thisState = static_cast<MethodInvocation*>(thisMachine->states()[3]);
	thisState->performOnEntry(thisMachine);
}
void MethodInvocation_Internal(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	MethodInvocation* thisState = static_cast<MethodInvocation*>(thisMachine->states()[3]);
	thisState->performInternal(thisMachine);
}
void MethodInvocation_OnExit(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	MethodInvocation* thisState = static_cast<MethodInvocation*>(thisMachine->states()[3]);
	thisState->performOnExit(thisMachine);
}

// Transition Evaluation Declarations
refl_bool INITIAL_Transition_0(refl_machine_t machine, refl_userData_t data);
refl_bool Names_Transition_0(refl_machine_t machine, refl_userData_t data);

// Transition Evaluation Implementations
refl_bool INITIAL_Transition_0(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	INITIAL* thisState = static_cast<INITIAL*>(thisMachine->states()[0]);
	CLTransition* thisTrans = thisState->transition(0);
	if (thisTrans->check(thisMachine, thisState))
	{
		return refl_TRUE;
	}
	else
	{
		return refl_FALSE;
	}
}

refl_bool Names_Transition_0(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	Names* thisState = static_cast<Names*>(thisMachine->states()[1]);
	CLTransition* thisTrans = thisState->transition(0);
	if (thisTrans->check(thisMachine, thisState))
	{
		return refl_TRUE;
	}
	else
	{
		return refl_FALSE;
	}
}

// Creation script
refl_metaMachine Create_MetaMachine()
{
	refl_metaMachine m = refl_initMetaMachine(NULL);
	refl_setMetaMachineName(m, "CLReflectDemo", NULL);
	refl_metaState states[4];

	//State INITIAL
	refl_metaState ms_INITIAL = refl_initMetaState(NULL);
	refl_setMetaStateName(ms_INITIAL, "INITIAL", NULL);

	refl_metaAction ma_INITIAL_OnEntry = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_INITIAL_OnEntry, INITIAL_OnEntry, NULL);
	refl_setOnEntry(ms_INITIAL, ma_INITIAL_OnEntry, NULL);
	refl_metaAction ma_INITIAL_Internal = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_INITIAL_Internal, INITIAL_Internal, NULL);
	refl_setInternal(ms_INITIAL, ma_INITIAL_Internal, NULL);
	refl_metaAction ma_INITIAL_OnExit = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_INITIAL_OnExit, INITIAL_OnExit, NULL);
	refl_setOnExit(ms_INITIAL, ma_INITIAL_OnExit, NULL);
	states[0] = ms_INITIAL;
	//State Names
	refl_metaState ms_Names = refl_initMetaState(NULL);
	refl_setMetaStateName(ms_Names, "Names", NULL);

	refl_metaAction ma_Names_OnEntry = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_Names_OnEntry, Names_OnEntry, NULL);
	refl_setOnEntry(ms_Names, ma_Names_OnEntry, NULL);
	refl_metaAction ma_Names_Internal = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_Names_Internal, Names_Internal, NULL);
	refl_setInternal(ms_Names, ma_Names_Internal, NULL);
	refl_metaAction ma_Names_OnExit = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_Names_OnExit, Names_OnExit, NULL);
	refl_setOnExit(ms_Names, ma_Names_OnExit, NULL);
	states[1] = ms_Names;
	//State States
	refl_metaState ms_States = refl_initMetaState(NULL);
	refl_setMetaStateName(ms_States, "States", NULL);

	refl_metaAction ma_States_OnEntry = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_States_OnEntry, States_OnEntry, NULL);
	refl_setOnEntry(ms_States, ma_States_OnEntry, NULL);
	refl_metaAction ma_States_Internal = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_States_Internal, States_Internal, NULL);
	refl_setInternal(ms_States, ma_States_Internal, NULL);
	refl_metaAction ma_States_OnExit = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_States_OnExit, States_OnExit, NULL);
	refl_setOnExit(ms_States, ma_States_OnExit, NULL);
	states[2] = ms_States;
	//State MethodInvocation
	refl_metaState ms_MethodInvocation = refl_initMetaState(NULL);
	refl_setMetaStateName(ms_MethodInvocation, "MethodInvocation", NULL);

	refl_metaAction ma_MethodInvocation_OnEntry = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_MethodInvocation_OnEntry, MethodInvocation_OnEntry, NULL);
	refl_setOnEntry(ms_MethodInvocation, ma_MethodInvocation_OnEntry, NULL);
	refl_metaAction ma_MethodInvocation_Internal = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_MethodInvocation_Internal, MethodInvocation_Internal, NULL);
	refl_setInternal(ms_MethodInvocation, ma_MethodInvocation_Internal, NULL);
	refl_metaAction ma_MethodInvocation_OnExit = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_MethodInvocation_OnExit, MethodInvocation_OnExit, NULL);
	refl_setOnExit(ms_MethodInvocation, ma_MethodInvocation_OnExit, NULL);
	states[3] = ms_MethodInvocation;
	refl_setMetaStates(m, states, 4, NULL);
	return m;
}
#pragma clang diagnostic pop
