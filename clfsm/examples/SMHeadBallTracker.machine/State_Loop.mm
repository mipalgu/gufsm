//
// State_Loop.mm -- 2013-05-02 06:11:52 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadBallTracker_Includes.h"
#include "SMHeadBallTracker.h"
#include "State_Loop.h"

#include "State_Loop_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadBallTracker;
using namespace State;

Loop::Loop(const char *name): CLState(name, *new Loop::OnEntry, *new Loop::OnExit, *new Loop::Internal)
{
	_transitions[0] = new Transition_0();
}

Loop::~Loop()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Loop::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_Loop_VarRefs.mm"
#	include "State_Loop_OnEntry.mm"
}

void Loop::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_Loop_VarRefs.mm"
#	include "State_Loop_OnExit.mm"
}

void Loop::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_Loop_VarRefs.mm"
#	include "State_Loop_Internal.mm"
}

bool Loop::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_Loop_VarRefs.mm"

	return
	(
#		include "State_Loop_Transition_0.expr"
	);
}
