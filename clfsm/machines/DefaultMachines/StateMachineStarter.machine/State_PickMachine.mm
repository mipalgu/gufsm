//
// State_PickMachine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_PickMachine.h"

#include "State_PickMachine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

PickMachine::PickMachine(const char *name): CLState(name, *new PickMachine::OnEntry, *new PickMachine::OnExit, *new PickMachine::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

PickMachine::~PickMachine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void PickMachine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_PickMachine_VarRefs.mm"
#	include "State_PickMachine_OnEntry.mm"
}

void PickMachine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_PickMachine_VarRefs.mm"
#	include "State_PickMachine_OnExit.mm"
}

void PickMachine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_PickMachine_VarRefs.mm"
#	include "State_PickMachine_Internal.mm"
}

bool PickMachine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_PickMachine_VarRefs.mm"

	return
	(
#		include "State_PickMachine_Transition_0.expr"
	);
}

bool PickMachine::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_PickMachine_VarRefs.mm"

	return
	(
#		include "State_PickMachine_Transition_1.expr"
	);
}

bool PickMachine::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_PickMachine_VarRefs.mm"

	return
	(
#		include "State_PickMachine_Transition_2.expr"
	);
}
