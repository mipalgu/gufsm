//
// State_AddThirdMachine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "AddMachineTest_Includes.h"
#include "AddMachineTest.h"
#include "State_AddThirdMachine.h"

#include "State_AddThirdMachine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMAddMachineTest;
using namespace State;

AddThirdMachine::AddThirdMachine(const char *name): CLState(name, *new AddThirdMachine::OnEntry, *new AddThirdMachine::OnExit, *new AddThirdMachine::Internal)
{
	_transitions[0] = new Transition_0();
}

AddThirdMachine::~AddThirdMachine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void AddThirdMachine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddThirdMachine_VarRefs.mm"
#	include "State_AddThirdMachine_OnEntry.mm"
}

void AddThirdMachine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddThirdMachine_VarRefs.mm"
#	include "State_AddThirdMachine_OnExit.mm"
}

void AddThirdMachine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddThirdMachine_VarRefs.mm"
#	include "State_AddThirdMachine_Internal.mm"
}

bool AddThirdMachine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddThirdMachine_VarRefs.mm"

	return
	(
#		include "State_AddThirdMachine_Transition_0.expr"
	);
}
