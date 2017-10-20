//
// State_FollowLine.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_FollowLine.h"

#include "State_FollowLine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

FollowLine::FollowLine(const char *name): CLState(name, *new FollowLine::OnEntry, *new FollowLine::OnExit, *new FollowLine::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

FollowLine::~FollowLine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void FollowLine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_FollowLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_FollowLine_FuncRefs.mm"
#	include "State_FollowLine_OnEntry.mm"
}

void FollowLine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_FollowLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_FollowLine_FuncRefs.mm"
#	include "State_FollowLine_OnExit.mm"
}

void FollowLine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_FollowLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_FollowLine_FuncRefs.mm"
#	include "State_FollowLine_Internal.mm"
}

bool FollowLine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_FollowLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_FollowLine_FuncRefs.mm"

	return
	(
#		include "State_FollowLine_Transition_0.expr"
	);
}
bool FollowLine::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_FollowLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_FollowLine_FuncRefs.mm"

	return
	(
#		include "State_FollowLine_Transition_1.expr"
	);
}
bool FollowLine::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_FollowLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_FollowLine_FuncRefs.mm"

	return
	(
#		include "State_FollowLine_Transition_2.expr"
	);
}
