//
// State_FocusOnGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSeeker_Includes.h"
#include "SMSeeker.h"
#include "State_FocusOnGoal.h"

#include "State_FocusOnGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSeeker;
using namespace State;

FocusOnGoal::FocusOnGoal(const char *name): CLState(name, *new FocusOnGoal::OnEntry, *new FocusOnGoal::OnExit, *new FocusOnGoal::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

FocusOnGoal::~FocusOnGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void FocusOnGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_FocusOnGoal_VarRefs.mm"
#	include "State_FocusOnGoal_OnEntry.mm"
}

void FocusOnGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_FocusOnGoal_VarRefs.mm"
#	include "State_FocusOnGoal_OnExit.mm"
}

void FocusOnGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_FocusOnGoal_VarRefs.mm"
#	include "State_FocusOnGoal_Internal.mm"
}

bool FocusOnGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_FocusOnGoal_VarRefs.mm"

	return
	(
#		include "State_FocusOnGoal_Transition_0.expr"
	);
}

bool FocusOnGoal::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_FocusOnGoal_VarRefs.mm"

	return
	(
#		include "State_FocusOnGoal_Transition_1.expr"
	);
}

bool FocusOnGoal::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_FocusOnGoal_VarRefs.mm"

	return
	(
#		include "State_FocusOnGoal_Transition_2.expr"
	);
}
