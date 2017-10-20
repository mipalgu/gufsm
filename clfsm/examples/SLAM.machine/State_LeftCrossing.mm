//
// State_LeftCrossing.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_LeftCrossing.h"

#include "State_LeftCrossing_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

LeftCrossing::LeftCrossing(const char *name): CLState(name, *new LeftCrossing::OnEntry, *new LeftCrossing::OnExit, *new LeftCrossing::Internal)
{
	_transitions[0] = new Transition_0();
}

LeftCrossing::~LeftCrossing()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void LeftCrossing::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_LeftCrossing_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_LeftCrossing_FuncRefs.mm"
#	include "State_LeftCrossing_OnEntry.mm"
}

void LeftCrossing::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_LeftCrossing_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_LeftCrossing_FuncRefs.mm"
#	include "State_LeftCrossing_OnExit.mm"
}

void LeftCrossing::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_LeftCrossing_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_LeftCrossing_FuncRefs.mm"
#	include "State_LeftCrossing_Internal.mm"
}

bool LeftCrossing::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_LeftCrossing_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_LeftCrossing_FuncRefs.mm"

	return
	(
#		include "State_LeftCrossing_Transition_0.expr"
	);
}
