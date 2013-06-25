//
// State_UpdateHead_rigt.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadGoalTracker_Includes.h"
#include "SMHeadGoalTracker.h"
#include "State_UpdateHead_rigt.h"

#include "State_UpdateHead_rigt_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadGoalTracker;
using namespace State;

UpdateHead_rigt::UpdateHead_rigt(const char *name): CLState(name, *new UpdateHead_rigt::OnEntry, *new UpdateHead_rigt::OnExit, *new UpdateHead_rigt::Internal)
{
	_transitions[0] = new Transition_0();
}

UpdateHead_rigt::~UpdateHead_rigt()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void UpdateHead_rigt::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_rigt_VarRefs.mm"
#	include "State_UpdateHead_rigt_OnEntry.mm"
}

void UpdateHead_rigt::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_rigt_VarRefs.mm"
#	include "State_UpdateHead_rigt_OnExit.mm"
}

void UpdateHead_rigt::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_rigt_VarRefs.mm"
#	include "State_UpdateHead_rigt_Internal.mm"
}

bool UpdateHead_rigt::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_rigt_VarRefs.mm"

	return
	(
#		include "State_UpdateHead_rigt_Transition_0.expr"
	);
}
