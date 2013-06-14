//
// State_UpdateHead_generic.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadGoalTracker_Includes.h"
#include "SMHeadGoalTracker.h"
#include "State_UpdateHead_generic.h"

#include "State_UpdateHead_generic_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadGoalTracker;
using namespace State;

UpdateHead_generic::UpdateHead_generic(const char *name): CLState(name, *new UpdateHead_generic::OnEntry, *new UpdateHead_generic::OnExit, *new UpdateHead_generic::Internal)
{
	_transitions[0] = new Transition_0();
}

UpdateHead_generic::~UpdateHead_generic()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void UpdateHead_generic::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_generic_VarRefs.mm"
#	include "State_UpdateHead_generic_OnEntry.mm"
}

void UpdateHead_generic::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_generic_VarRefs.mm"
#	include "State_UpdateHead_generic_OnExit.mm"
}

void UpdateHead_generic::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_generic_VarRefs.mm"
#	include "State_UpdateHead_generic_Internal.mm"
}

bool UpdateHead_generic::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_UpdateHead_generic_VarRefs.mm"

	return
	(
#		include "State_UpdateHead_generic_Transition_0.expr"
	);
}
