//
// State_Spacing.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_Spacing.h"

#include "State_Spacing_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

Spacing::Spacing(const char *name): CLState(name, *new Spacing::OnEntry, *new Spacing::OnExit, *new Spacing::Internal)
{
	_transitions[0] = new Transition_0();
}

Spacing::~Spacing()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Spacing::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Spacing_VarRefs.mm"
#	include "State_Spacing_OnEntry.mm"
}

void Spacing::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Spacing_VarRefs.mm"
#	include "State_Spacing_OnExit.mm"
}

void Spacing::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Spacing_VarRefs.mm"
#	include "State_Spacing_Internal.mm"
}

bool Spacing::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Spacing_VarRefs.mm"

	return
	(
#		include "State_Spacing_Transition_0.expr"
	);
}
