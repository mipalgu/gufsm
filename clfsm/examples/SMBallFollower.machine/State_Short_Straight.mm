//
// State_Short_Straight.mm -- 2013-05-09 04:48:07 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMBallFollower_Includes.h"
#include "SMBallFollower.h"
#include "State_Short_Straight.h"

#include "State_Short_Straight_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMBallFollower;
using namespace State;

Short_Straight::Short_Straight(const char *name): CLState(name, *new Short_Straight::OnEntry, *new Short_Straight::OnExit, *new Short_Straight::Internal)
{
	_transitions[0] = new Transition_0();
}

Short_Straight::~Short_Straight()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Short_Straight::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Short_Straight_VarRefs.mm"
#	include "State_Short_Straight_OnEntry.mm"
}

void Short_Straight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Short_Straight_VarRefs.mm"
#	include "State_Short_Straight_OnExit.mm"
}

void Short_Straight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Short_Straight_VarRefs.mm"
#	include "State_Short_Straight_Internal.mm"
}

bool Short_Straight::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Short_Straight_VarRefs.mm"

	return
	(
#		include "State_Short_Straight_Transition_0.expr"
	);
}
