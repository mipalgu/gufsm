//
// State_Dummy.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadGoalTracker_Includes.h"
#include "SMHeadGoalTracker.h"
#include "State_Dummy.h"

#include "State_Dummy_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadGoalTracker;
using namespace State;

Dummy::Dummy(const char *name): CLState(name, *new Dummy::OnEntry, *new Dummy::OnExit, *new Dummy::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Dummy::~Dummy()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Dummy::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Dummy_VarRefs.mm"
#	include "State_Dummy_OnEntry.mm"
}

void Dummy::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Dummy_VarRefs.mm"
#	include "State_Dummy_OnExit.mm"
}

void Dummy::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Dummy_VarRefs.mm"
#	include "State_Dummy_Internal.mm"
}

bool Dummy::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Dummy_VarRefs.mm"

	return
	(
#		include "State_Dummy_Transition_0.expr"
	);
}

bool Dummy::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Dummy_VarRefs.mm"

	return
	(
#		include "State_Dummy_Transition_1.expr"
	);
}
