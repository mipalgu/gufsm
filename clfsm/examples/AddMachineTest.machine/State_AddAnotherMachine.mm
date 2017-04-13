//
// State_AddAnotherMachine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "AddMachineTest_Includes.h"
#include "AddMachineTest.h"
#include "State_AddAnotherMachine.h"

#include "State_AddAnotherMachine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMAddMachineTest;
using namespace State;

AddAnotherMachine::AddAnotherMachine(const char *name): CLState(name, *new AddAnotherMachine::OnEntry, *new AddAnotherMachine::OnExit, *new AddAnotherMachine::Internal)
{
}

AddAnotherMachine::~AddAnotherMachine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void AddAnotherMachine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddAnotherMachine_VarRefs.mm"
#	include "State_AddAnotherMachine_OnEntry.mm"
}

void AddAnotherMachine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddAnotherMachine_VarRefs.mm"
#	include "State_AddAnotherMachine_OnExit.mm"
}

void AddAnotherMachine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_AddAnotherMachine_VarRefs.mm"
#	include "State_AddAnotherMachine_Internal.mm"
}
