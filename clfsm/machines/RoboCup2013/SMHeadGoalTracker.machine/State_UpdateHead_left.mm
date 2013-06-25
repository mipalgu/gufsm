//
// State_UpdateHead_left.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadGoalTracker_Includes.h"
#include "SMHeadGoalTracker.h"
#include "State_UpdateHead_left.h"

#include "State_UpdateHead_left_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadGoalTracker;
using namespace State;

UpdateHead_left::UpdateHead_left(const char *name): CLState(name, *new UpdateHead_left::OnEntry, *new UpdateHead_left::OnExit, *new UpdateHead_left::Internal)
{
	_transitions[0] = new Transition_0();
}

UpdateHead_left::~UpdateHead_left()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void UpdateHead_left::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_left_VarRefs.mm"
#	include "State_UpdateHead_left_OnEntry.mm"
}

void UpdateHead_left::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_left_VarRefs.mm"
#	include "State_UpdateHead_left_OnExit.mm"
}

void UpdateHead_left::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_left_VarRefs.mm"
#	include "State_UpdateHead_left_Internal.mm"
}

bool UpdateHead_left::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_left_VarRefs.mm"

	return
	(
#		include "State_UpdateHead_left_Transition_0.expr"
	);
}
