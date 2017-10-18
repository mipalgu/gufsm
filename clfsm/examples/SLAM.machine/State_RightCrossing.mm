//
// State_RightCrossing.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_RightCrossing.h"

#include "State_RightCrossing_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

RightCrossing::RightCrossing(const char *name): CLState(name, *new RightCrossing::OnEntry, *new RightCrossing::OnExit, *new RightCrossing::Internal)
{
	_transitions[0] = new Transition_0();
}

RightCrossing::~RightCrossing()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void RightCrossing::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_RightCrossing_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_RightCrossing_FuncRefs.mm"
#	include "State_RightCrossing_OnEntry.mm"
}

void RightCrossing::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_RightCrossing_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_RightCrossing_FuncRefs.mm"
#	include "State_RightCrossing_OnExit.mm"
}

void RightCrossing::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_RightCrossing_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_RightCrossing_FuncRefs.mm"
#	include "State_RightCrossing_Internal.mm"
}

bool RightCrossing::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_RightCrossing_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_RightCrossing_FuncRefs.mm"

	return
	(
#		include "State_RightCrossing_Transition_0.expr"
	);
}
