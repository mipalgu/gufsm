//
// State_UnloadMachine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "AddMachineTest_Includes.h"
#include "AddMachineTest.h"
#include "State_UnloadMachine.h"

#include "State_UnloadMachine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMAddMachineTest;
using namespace State;

UnloadMachine::UnloadMachine(const char *name): CLState(name, *new UnloadMachine::OnEntry, *new UnloadMachine::OnExit, *new UnloadMachine::Internal)
{
	_transitions[0] = new Transition_0();
}

UnloadMachine::~UnloadMachine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void UnloadMachine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_UnloadMachine_VarRefs.mm"
#	include "State_UnloadMachine_OnEntry.mm"
}

void UnloadMachine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_UnloadMachine_VarRefs.mm"
#	include "State_UnloadMachine_OnExit.mm"
}

void UnloadMachine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_UnloadMachine_VarRefs.mm"
#	include "State_UnloadMachine_Internal.mm"
}

bool UnloadMachine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_UnloadMachine_VarRefs.mm"

	return
	(
#		include "State_UnloadMachine_Transition_0.expr"
	);
}
