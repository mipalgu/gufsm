//
// State_unloadMachine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "AddMachineTest_Includes.h"
#include "AddMachineTest.h"
#include "State_unloadMachine.h"

#include "State_unloadMachine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMAddMachineTest;
using namespace State;

unloadMachine::unloadMachine(const char *name): CLState(name, *new unloadMachine::OnEntry, *new unloadMachine::OnExit, *new unloadMachine::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

unloadMachine::~unloadMachine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void unloadMachine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_unloadMachine_VarRefs.mm"
#	include "State_unloadMachine_OnEntry.mm"
}

void unloadMachine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_unloadMachine_VarRefs.mm"
#	include "State_unloadMachine_OnExit.mm"
}

void unloadMachine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_unloadMachine_VarRefs.mm"
#	include "State_unloadMachine_Internal.mm"
}

bool unloadMachine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_unloadMachine_VarRefs.mm"

	return
	(
#		include "State_unloadMachine_Transition_0.expr"
	);
}

bool unloadMachine::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_unloadMachine_VarRefs.mm"

	return
	(
#		include "State_unloadMachine_Transition_1.expr"
	);
}
