//
// State_AvoidGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_AvoidGoal.h"

#include "State_AvoidGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

AvoidGoal::AvoidGoal(const char *name): CLState(name, *new AvoidGoal::OnEntry, *new AvoidGoal::OnExit, *new AvoidGoal::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

AvoidGoal::~AvoidGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void AvoidGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_AvoidGoal_VarRefs.mm"
#	include "State_AvoidGoal_OnEntry.mm"
}

void AvoidGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_AvoidGoal_VarRefs.mm"
#	include "State_AvoidGoal_OnExit.mm"
}

void AvoidGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_AvoidGoal_VarRefs.mm"
#	include "State_AvoidGoal_Internal.mm"
}

bool AvoidGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_AvoidGoal_VarRefs.mm"

	return
	(
#		include "State_AvoidGoal_Transition_0.expr"
	);
}

bool AvoidGoal::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_AvoidGoal_VarRefs.mm"

	return
	(
#		include "State_AvoidGoal_Transition_1.expr"
	);
}
