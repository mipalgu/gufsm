//
// State_AddSecondMachine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "AddMachineTest_Includes.h"
#include "AddMachineTest.h"
#include "State_AddSecondMachine.h"

#include "State_AddSecondMachine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMAddMachineTest;
using namespace State;

AddSecondMachine::AddSecondMachine(const char *name): CLState(name, *new AddSecondMachine::OnEntry, *new AddSecondMachine::OnExit, *new AddSecondMachine::Internal)
{
	_transitions[0] = new Transition_0();
}

AddSecondMachine::~AddSecondMachine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void AddSecondMachine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddSecondMachine_VarRefs.mm"
#	include "State_AddSecondMachine_OnEntry.mm"
}

void AddSecondMachine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddSecondMachine_VarRefs.mm"
#	include "State_AddSecondMachine_OnExit.mm"
}

void AddSecondMachine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddSecondMachine_VarRefs.mm"
#	include "State_AddSecondMachine_Internal.mm"
}

bool AddSecondMachine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddSecondMachine_VarRefs.mm"

	return
	(
#		include "State_AddSecondMachine_Transition_0.expr"
	);
}
