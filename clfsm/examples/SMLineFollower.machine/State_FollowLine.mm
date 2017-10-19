//
// State_FollowLine.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SMLineFollower_Includes.h"
#include "SMLineFollower.h"
#include "State_FollowLine.h"

#include "State_FollowLine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMLineFollower;
using namespace State;

FollowLine::FollowLine(const char *name): CLState(name, *new FollowLine::OnEntry, *new FollowLine::OnExit, *new FollowLine::Internal)
{
	_transitions[0] = new Transition_0();
}

FollowLine::~FollowLine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void FollowLine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMLineFollower_VarRefs.mm"
#	include "State_FollowLine_VarRefs.mm"
#	include "SMLineFollower_FuncRefs.mm"
#	include "State_FollowLine_FuncRefs.mm"
#	include "State_FollowLine_OnEntry.mm"
}

void FollowLine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMLineFollower_VarRefs.mm"
#	include "State_FollowLine_VarRefs.mm"
#	include "SMLineFollower_FuncRefs.mm"
#	include "State_FollowLine_FuncRefs.mm"
#	include "State_FollowLine_OnExit.mm"
}

void FollowLine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMLineFollower_VarRefs.mm"
#	include "State_FollowLine_VarRefs.mm"
#	include "SMLineFollower_FuncRefs.mm"
#	include "State_FollowLine_FuncRefs.mm"
#	include "State_FollowLine_Internal.mm"
}

bool FollowLine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMLineFollower_VarRefs.mm"
#	include "State_FollowLine_VarRefs.mm"
#	include "SMLineFollower_FuncRefs.mm"
#	include "State_FollowLine_FuncRefs.mm"

	return
	(
#		include "State_FollowLine_Transition_0.expr"
	);
}
