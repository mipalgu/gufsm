//
// State_GoToGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayerGoal_Includes.h"
#include "SMPlayerGoal.h"
#include "State_GoToGoal.h"

#include "State_GoToGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayerGoal;
using namespace State;

GoToGoal::GoToGoal(const char *name): CLState(name, *new GoToGoal::OnEntry, *new GoToGoal::OnExit, *new GoToGoal::Internal)
{
	_transitions[0] = new Transition_0();
}

GoToGoal::~GoToGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void GoToGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_GoToGoal_VarRefs.mm"
#	include "State_GoToGoal_OnEntry.mm"
}

void GoToGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_GoToGoal_VarRefs.mm"
#	include "State_GoToGoal_OnExit.mm"
}

void GoToGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_GoToGoal_VarRefs.mm"
#	include "State_GoToGoal_Internal.mm"
}

bool GoToGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_GoToGoal_VarRefs.mm"

	return
	(
#		include "State_GoToGoal_Transition_0.expr"
	);
}
