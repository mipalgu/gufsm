//
// State_FollowBall.mm -- 2013-05-01 07:49:36 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"
#include "State_FollowBall.h"

#include "State_FollowBall_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayer;
using namespace State;

FollowBall::FollowBall(const char *name): CLState(name, *new FollowBall::OnEntry, *new FollowBall::OnExit, *new FollowBall::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

FollowBall::~FollowBall()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void FollowBall::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_FollowBall_VarRefs.mm"
#	include "State_FollowBall_OnEntry.mm"
}

void FollowBall::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_FollowBall_VarRefs.mm"
#	include "State_FollowBall_OnExit.mm"
}

void FollowBall::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_FollowBall_VarRefs.mm"
#	include "State_FollowBall_Internal.mm"
}

bool FollowBall::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_FollowBall_VarRefs.mm"

	return
	(
#		include "State_FollowBall_Transition_0.expr"
	);
}

bool FollowBall::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_FollowBall_VarRefs.mm"

	return
	(
#		include "State_FollowBall_Transition_1.expr"
	);
}
