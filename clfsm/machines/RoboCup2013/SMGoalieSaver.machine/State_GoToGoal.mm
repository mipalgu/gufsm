//
// State_GoToGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_GoToGoal.h"

#include "State_GoToGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

GoToGoal::GoToGoal(const char *name): CLState(name, *new GoToGoal::OnEntry, *new GoToGoal::OnExit, *new GoToGoal::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

GoToGoal::~GoToGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void GoToGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_GoToGoal_VarRefs.mm"
#	include "State_GoToGoal_OnEntry.mm"
}

void GoToGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_GoToGoal_VarRefs.mm"
#	include "State_GoToGoal_OnExit.mm"
}

void GoToGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_GoToGoal_VarRefs.mm"
#	include "State_GoToGoal_Internal.mm"
}

bool GoToGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_GoToGoal_VarRefs.mm"

	return
	(
#		include "State_GoToGoal_Transition_0.expr"
	);
}

bool GoToGoal::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_GoToGoal_VarRefs.mm"

	return
	(
#		include "State_GoToGoal_Transition_1.expr"
	);
}
