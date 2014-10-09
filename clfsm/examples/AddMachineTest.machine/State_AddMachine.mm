//
// State_AddMachine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "AddMachineTest_Includes.h"
#include "AddMachineTest.h"
#include "State_AddMachine.h"

#include "State_AddMachine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMAddMachineTest;
using namespace State;

AddMachine::AddMachine(const char *name): CLState(name, *new AddMachine::OnEntry, *new AddMachine::OnExit, *new AddMachine::Internal)
{
	_transitions[0] = new Transition_0();
}

AddMachine::~AddMachine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void AddMachine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddMachine_VarRefs.mm"
#	include "State_AddMachine_OnEntry.mm"
}

void AddMachine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddMachine_VarRefs.mm"
#	include "State_AddMachine_OnExit.mm"
}

void AddMachine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddMachine_VarRefs.mm"
#	include "State_AddMachine_Internal.mm"
}

bool AddMachine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddMachine_VarRefs.mm"

	return
	(
#		include "State_AddMachine_Transition_0.expr"
	);
}
