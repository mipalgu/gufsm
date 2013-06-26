//
// State_Turn_Head_To_Goal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReady_Includes.h"
#include "SMReady.h"
#include "State_Turn_Head_To_Goal.h"

#include "State_Turn_Head_To_Goal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReady;
using namespace State;

Turn_Head_To_Goal::Turn_Head_To_Goal(const char *name): CLState(name, *new Turn_Head_To_Goal::OnEntry, *new Turn_Head_To_Goal::OnExit, *new Turn_Head_To_Goal::Internal)
{
	_transitions[0] = new Transition_0();
}

Turn_Head_To_Goal::~Turn_Head_To_Goal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Turn_Head_To_Goal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Turn_Head_To_Goal_VarRefs.mm"
#	include "State_Turn_Head_To_Goal_OnEntry.mm"
}

void Turn_Head_To_Goal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Turn_Head_To_Goal_VarRefs.mm"
#	include "State_Turn_Head_To_Goal_OnExit.mm"
}

void Turn_Head_To_Goal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Turn_Head_To_Goal_VarRefs.mm"
#	include "State_Turn_Head_To_Goal_Internal.mm"
}

bool Turn_Head_To_Goal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Turn_Head_To_Goal_VarRefs.mm"

	return
	(
#		include "State_Turn_Head_To_Goal_Transition_0.expr"
	);
}
