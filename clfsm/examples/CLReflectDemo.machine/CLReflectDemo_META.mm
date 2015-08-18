#pragma clang diagnostic ignored "-Wunused-parameter"

#include "CLReflectAPI.h"
#include "CLReflectDemo.h"
#include "State_INITIAL.h"
#include "State_Names.h"
#include "State_StatesActions.h"
#include "State_MethodInvocation.h"
#include "State_Transitions.h"
#include "State_End.h"

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
void StatesActions_OnEntry(refl_machine_t machine, refl_userData_t data);
void StatesActions_Internal(refl_machine_t machine, refl_userData_t data);
void StatesActions_OnExit(refl_machine_t machine, refl_userData_t data);
void MethodInvocation_OnEntry(refl_machine_t machine, refl_userData_t data);
void MethodInvocation_Internal(refl_machine_t machine, refl_userData_t data);
void MethodInvocation_OnExit(refl_machine_t machine, refl_userData_t data);
void Transitions_OnEntry(refl_machine_t machine, refl_userData_t data);
void Transitions_Internal(refl_machine_t machine, refl_userData_t data);
void Transitions_OnExit(refl_machine_t machine, refl_userData_t data);
void End_OnEntry(refl_machine_t machine, refl_userData_t data);
void End_Internal(refl_machine_t machine, refl_userData_t data);
void End_OnExit(refl_machine_t machine, refl_userData_t data);

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
void StatesActions_OnEntry(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	StatesActions* thisState = static_cast<StatesActions*>(thisMachine->states()[2]);
	thisState->performOnEntry(thisMachine);
}
void StatesActions_Internal(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	StatesActions* thisState = static_cast<StatesActions*>(thisMachine->states()[2]);
	thisState->performInternal(thisMachine);
}
void StatesActions_OnExit(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	StatesActions* thisState = static_cast<StatesActions*>(thisMachine->states()[2]);
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
void Transitions_OnEntry(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	Transitions* thisState = static_cast<Transitions*>(thisMachine->states()[4]);
	thisState->performOnEntry(thisMachine);
}
void Transitions_Internal(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	Transitions* thisState = static_cast<Transitions*>(thisMachine->states()[4]);
	thisState->performInternal(thisMachine);
}
void Transitions_OnExit(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	Transitions* thisState = static_cast<Transitions*>(thisMachine->states()[4]);
	thisState->performOnExit(thisMachine);
}
void End_OnEntry(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	End* thisState = static_cast<End*>(thisMachine->states()[5]);
	thisState->performOnEntry(thisMachine);
}
void End_Internal(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	End* thisState = static_cast<End*>(thisMachine->states()[5]);
	thisState->performInternal(thisMachine);
}
void End_OnExit(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	End* thisState = static_cast<End*>(thisMachine->states()[5]);
	thisState->performOnExit(thisMachine);
}

// Transition Evaluation Declarations
refl_bool INITIAL_Transition_0(refl_machine_t machine, refl_userData_t data);
refl_bool Names_Transition_0(refl_machine_t machine, refl_userData_t data);
refl_bool StatesActions_Transition_0(refl_machine_t machine, refl_userData_t data);

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

refl_bool StatesActions_Transition_0(refl_machine_t machine, refl_userData_t data)
{
	CLReflectDemo* thisMachine = static_cast<CLReflectDemo*>(machine);
	StatesActions* thisState = static_cast<StatesActions*>(thisMachine->states()[2]);
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
	refl_metaState states[6];

	
	//State: INITIAL
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
	refl_metaTransition INITIAL_transitions[1];
	refl_metaTransition mt_INITIAL_T_0 = refl_initMetaTransition(NULL);
	refl_setMetaTransitionSource(mt_INITIAL_T_0, 0, NULL);
	refl_setMetaTransitionTarget(mt_INITIAL_T_0, 1, NULL);
	refl_setMetaTransitionExpression(mt_INITIAL_T_0, "true", NULL);
	refl_transitionEval_f mt_INITIAL_T_0_eval_f = INITIAL_Transition_0;
	refl_setMetaTransitionEvalFunction(mt_INITIAL_T_0, mt_INITIAL_T_0_eval_f, NULL, NULL);
	INITIAL_transitions[0] = mt_INITIAL_T_0;
	refl_setMetaTransitions(ms_INITIAL, INITIAL_transitions, 1, NULL);
	
	//State: Names
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
	refl_metaTransition Names_transitions[1];
	refl_metaTransition mt_Names_T_0 = refl_initMetaTransition(NULL);
	refl_setMetaTransitionSource(mt_Names_T_0, 1, NULL);
	refl_setMetaTransitionTarget(mt_Names_T_0, 2, NULL);
	refl_setMetaTransitionExpression(mt_Names_T_0, "true", NULL);
	refl_transitionEval_f mt_Names_T_0_eval_f = Names_Transition_0;
	refl_setMetaTransitionEvalFunction(mt_Names_T_0, mt_Names_T_0_eval_f, NULL, NULL);
	Names_transitions[0] = mt_Names_T_0;
	refl_setMetaTransitions(ms_Names, Names_transitions, 1, NULL);
	
	//State: StatesActions
	refl_metaState ms_StatesActions = refl_initMetaState(NULL);
	refl_setMetaStateName(ms_StatesActions, "StatesActions", NULL);

	refl_metaAction ma_StatesActions_OnEntry = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_StatesActions_OnEntry, StatesActions_OnEntry, NULL);
	refl_setOnEntry(ms_StatesActions, ma_StatesActions_OnEntry, NULL);
	refl_metaAction ma_StatesActions_Internal = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_StatesActions_Internal, StatesActions_Internal, NULL);
	refl_setInternal(ms_StatesActions, ma_StatesActions_Internal, NULL);
	refl_metaAction ma_StatesActions_OnExit = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_StatesActions_OnExit, StatesActions_OnExit, NULL);
	refl_setOnExit(ms_StatesActions, ma_StatesActions_OnExit, NULL);
	states[2] = ms_StatesActions;
	refl_metaTransition StatesActions_transitions[1];
	refl_metaTransition mt_StatesActions_T_0 = refl_initMetaTransition(NULL);
	refl_setMetaTransitionSource(mt_StatesActions_T_0, 2, NULL);
	refl_setMetaTransitionTarget(mt_StatesActions_T_0, 4, NULL);
	refl_setMetaTransitionExpression(mt_StatesActions_T_0, "after_ms(25)", NULL);
	refl_transitionEval_f mt_StatesActions_T_0_eval_f = StatesActions_Transition_0;
	refl_setMetaTransitionEvalFunction(mt_StatesActions_T_0, mt_StatesActions_T_0_eval_f, NULL, NULL);
	StatesActions_transitions[0] = mt_StatesActions_T_0;
	refl_setMetaTransitions(ms_StatesActions, StatesActions_transitions, 1, NULL);
	
	//State: MethodInvocation
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
	
	//State: Transitions
	refl_metaState ms_Transitions = refl_initMetaState(NULL);
	refl_setMetaStateName(ms_Transitions, "Transitions", NULL);

	refl_metaAction ma_Transitions_OnEntry = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_Transitions_OnEntry, Transitions_OnEntry, NULL);
	refl_setOnEntry(ms_Transitions, ma_Transitions_OnEntry, NULL);
	refl_metaAction ma_Transitions_Internal = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_Transitions_Internal, Transitions_Internal, NULL);
	refl_setInternal(ms_Transitions, ma_Transitions_Internal, NULL);
	refl_metaAction ma_Transitions_OnExit = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_Transitions_OnExit, Transitions_OnExit, NULL);
	refl_setOnExit(ms_Transitions, ma_Transitions_OnExit, NULL);
	states[4] = ms_Transitions;
	
	//State: End
	refl_metaState ms_End = refl_initMetaState(NULL);
	refl_setMetaStateName(ms_End, "End", NULL);

	refl_metaAction ma_End_OnEntry = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_End_OnEntry, End_OnEntry, NULL);
	refl_setOnEntry(ms_End, ma_End_OnEntry, NULL);
	refl_metaAction ma_End_Internal = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_End_Internal, End_Internal, NULL);
	refl_setInternal(ms_End, ma_End_Internal, NULL);
	refl_metaAction ma_End_OnExit = refl_initMetaAction(NULL);
	refl_setMetaActionMethod(ma_End_OnExit, End_OnExit, NULL);
	refl_setOnExit(ms_End, ma_End_OnExit, NULL);
	states[5] = ms_End;
	refl_setMetaStates(m, states, 6, NULL);
	return m;
}
#pragma clang diagnostic pop
