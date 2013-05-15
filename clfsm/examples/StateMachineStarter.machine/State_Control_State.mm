//
// State_Control_State.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_Control_State.h"

#include "State_Control_State_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

Control_State::Control_State(const char *name): CLState(name, *new Control_State::OnEntry, *new Control_State::OnExit, *new Control_State::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Control_State::~Control_State()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Control_State::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Control_State_VarRefs.mm"
#	include "State_Control_State_OnEntry.mm"
}

void Control_State::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Control_State_VarRefs.mm"
#	include "State_Control_State_OnExit.mm"
}

void Control_State::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Control_State_VarRefs.mm"
#	include "State_Control_State_Internal.mm"
}

bool Control_State::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Control_State_VarRefs.mm"

	return
	(
#		include "State_Control_State_Transition_0.expr"
	);
}

bool Control_State::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Control_State_VarRefs.mm"

	return
	(
#		include "State_Control_State_Transition_1.expr"
	);
}
