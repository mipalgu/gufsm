//
// State_UpdateHead.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadBallTracker_Includes.h"
#include "SMHeadBallTracker.h"
#include "State_UpdateHead.h"

#include "State_UpdateHead_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadBallTracker;
using namespace State;

UpdateHead::UpdateHead(const char *name): CLState(name, *new UpdateHead::OnEntry, *new UpdateHead::OnExit, *new UpdateHead::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

UpdateHead::~UpdateHead()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void UpdateHead::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_UpdateHead_VarRefs.mm"
#	include "State_UpdateHead_OnEntry.mm"
}

void UpdateHead::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_UpdateHead_VarRefs.mm"
#	include "State_UpdateHead_OnExit.mm"
}

void UpdateHead::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_UpdateHead_VarRefs.mm"
#	include "State_UpdateHead_Internal.mm"
}

bool UpdateHead::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_UpdateHead_VarRefs.mm"

	return
	(
#		include "State_UpdateHead_Transition_0.expr"
	);
}

bool UpdateHead::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_UpdateHead_VarRefs.mm"

	return
	(
#		include "State_UpdateHead_Transition_1.expr"
	);
}
