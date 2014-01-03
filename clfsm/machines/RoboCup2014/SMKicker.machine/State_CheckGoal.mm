//
// State_CheckGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_CheckGoal.h"

#include "State_CheckGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

CheckGoal::CheckGoal(const char *name): CLState(name, *new CheckGoal::OnEntry, *new CheckGoal::OnExit, *new CheckGoal::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CheckGoal::~CheckGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void CheckGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_CheckGoal_VarRefs.mm"
#	include "State_CheckGoal_OnEntry.mm"
}

void CheckGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_CheckGoal_VarRefs.mm"
#	include "State_CheckGoal_OnExit.mm"
}

void CheckGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_CheckGoal_VarRefs.mm"
#	include "State_CheckGoal_Internal.mm"
}

bool CheckGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_CheckGoal_VarRefs.mm"

	return
	(
#		include "State_CheckGoal_Transition_0.expr"
	);
}

bool CheckGoal::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_CheckGoal_VarRefs.mm"

	return
	(
#		include "State_CheckGoal_Transition_1.expr"
	);
}
