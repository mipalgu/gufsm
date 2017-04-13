//
// State_GetMetaMachine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "CLReflectDemo_Includes.h"
#include "CLReflectDemo.h"
#include "State_GetMetaMachine.h"

#include "State_GetMetaMachine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCLReflectDemo;
using namespace State;

GetMetaMachine::GetMetaMachine(const char *name): CLState(name, *new GetMetaMachine::OnEntry, *new GetMetaMachine::OnExit, *new GetMetaMachine::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

GetMetaMachine::~GetMetaMachine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void GetMetaMachine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_GetMetaMachine_VarRefs.mm"
#	include "State_GetMetaMachine_OnEntry.mm"
}

void GetMetaMachine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_GetMetaMachine_VarRefs.mm"
#	include "State_GetMetaMachine_OnExit.mm"
}

void GetMetaMachine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_GetMetaMachine_VarRefs.mm"
#	include "State_GetMetaMachine_Internal.mm"
}

bool GetMetaMachine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_GetMetaMachine_VarRefs.mm"

	return
	(
#		include "State_GetMetaMachine_Transition_0.expr"
	);
}

bool GetMetaMachine::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_GetMetaMachine_VarRefs.mm"

	return
	(
#		include "State_GetMetaMachine_Transition_1.expr"
	);
}
