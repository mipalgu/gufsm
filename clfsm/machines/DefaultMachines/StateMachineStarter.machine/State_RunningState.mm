//
// State_RunningState.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_RunningState.h"

#include "State_RunningState_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

RunningState::RunningState(const char *name): CLState(name, *new RunningState::OnEntry, *new RunningState::OnExit, *new RunningState::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

RunningState::~RunningState()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void RunningState::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_RunningState_VarRefs.mm"
#	include "State_RunningState_OnEntry.mm"
}

void RunningState::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_RunningState_VarRefs.mm"
#	include "State_RunningState_OnExit.mm"
}

void RunningState::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_RunningState_VarRefs.mm"
#	include "State_RunningState_Internal.mm"
}

bool RunningState::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_RunningState_VarRefs.mm"

	return
	(
#		include "State_RunningState_Transition_0.expr"
	);
}

bool RunningState::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_RunningState_VarRefs.mm"

	return
	(
#		include "State_RunningState_Transition_1.expr"
	);
}
