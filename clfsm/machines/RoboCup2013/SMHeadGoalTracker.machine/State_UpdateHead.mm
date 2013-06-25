//
// State_UpdateHead.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadGoalTracker_Includes.h"
#include "SMHeadGoalTracker.h"
#include "State_UpdateHead.h"

#include "State_UpdateHead_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadGoalTracker;
using namespace State;

UpdateHead::UpdateHead(const char *name): CLState(name, *new UpdateHead::OnEntry, *new UpdateHead::OnExit, *new UpdateHead::Internal)
{
	_transitions[0] = new Transition_0();
}

UpdateHead::~UpdateHead()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void UpdateHead::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_VarRefs.mm"
#	include "State_UpdateHead_OnEntry.mm"
}

void UpdateHead::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_VarRefs.mm"
#	include "State_UpdateHead_OnExit.mm"
}

void UpdateHead::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_VarRefs.mm"
#	include "State_UpdateHead_Internal.mm"
}

bool UpdateHead::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_VarRefs.mm"

	return
	(
#		include "State_UpdateHead_Transition_0.expr"
	);
}
