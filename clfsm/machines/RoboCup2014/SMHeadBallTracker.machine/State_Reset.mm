//
// State_Reset.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadBallTracker_Includes.h"
#include "SMHeadBallTracker.h"
#include "State_Reset.h"

#include "State_Reset_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadBallTracker;
using namespace State;

Reset::Reset(const char *name): CLState(name, *new Reset::OnEntry, *new Reset::OnExit, *new Reset::Internal)
{
	_transitions[0] = new Transition_0();
}

Reset::~Reset()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Reset::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_Reset_VarRefs.mm"
#	include "State_Reset_OnEntry.mm"
}

void Reset::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_Reset_VarRefs.mm"
#	include "State_Reset_OnExit.mm"
}

void Reset::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_Reset_VarRefs.mm"
#	include "State_Reset_Internal.mm"
}

bool Reset::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_Reset_VarRefs.mm"

	return
	(
#		include "State_Reset_Transition_0.expr"
	);
}
