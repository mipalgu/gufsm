//
// State_FollowBall.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalie_Includes.h"
#include "SMGoalie.h"
#include "State_FollowBall.h"

#include "State_FollowBall_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalie;
using namespace State;

FollowBall::FollowBall(const char *name): CLState(name, *new FollowBall::OnEntry, *new FollowBall::OnExit, *new FollowBall::Internal)
{
	_transitions[0] = new Transition_0();
}

FollowBall::~FollowBall()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void FollowBall::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalie_VarRefs.mm"
#	include "State_FollowBall_VarRefs.mm"
#	include "State_FollowBall_OnEntry.mm"
}

void FollowBall::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalie_VarRefs.mm"
#	include "State_FollowBall_VarRefs.mm"
#	include "State_FollowBall_OnExit.mm"
}

void FollowBall::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalie_VarRefs.mm"
#	include "State_FollowBall_VarRefs.mm"
#	include "State_FollowBall_Internal.mm"
}

bool FollowBall::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalie_VarRefs.mm"
#	include "State_FollowBall_VarRefs.mm"

	return
	(
#		include "State_FollowBall_Transition_0.expr"
	);
}
