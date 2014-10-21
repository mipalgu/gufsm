//
// State_DoNothing.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "AddMachineTest_Includes.h"
#include "AddMachineTest.h"
#include "State_DoNothing.h"

#include "State_DoNothing_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMAddMachineTest;
using namespace State;

DoNothing::DoNothing(const char *name): CLState(name, *new DoNothing::OnEntry, *new DoNothing::OnExit, *new DoNothing::Internal)
{
	_transitions[0] = new Transition_0();
}

DoNothing::~DoNothing()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void DoNothing::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_DoNothing_VarRefs.mm"
#	include "State_DoNothing_OnEntry.mm"
}

void DoNothing::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_DoNothing_VarRefs.mm"
#	include "State_DoNothing_OnExit.mm"
}

void DoNothing::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_DoNothing_VarRefs.mm"
#	include "State_DoNothing_Internal.mm"
}

bool DoNothing::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "AddMachineTest_VarRefs.mm"
#	include "State_DoNothing_VarRefs.mm"

	return
	(
#		include "State_DoNothing_Transition_0.expr"
	);
}
