//
// State_RightTurn.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_RightTurn.h"

#include "State_RightTurn_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

RightTurn::RightTurn(const char *name): CLState(name, *new RightTurn::OnEntry, *new RightTurn::OnExit, *new RightTurn::Internal)
{
	_transitions[0] = new Transition_0();
}

RightTurn::~RightTurn()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void RightTurn::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_RightTurn_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_RightTurn_FuncRefs.mm"
#	include "State_RightTurn_OnEntry.mm"
}

void RightTurn::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_RightTurn_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_RightTurn_FuncRefs.mm"
#	include "State_RightTurn_OnExit.mm"
}

void RightTurn::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_RightTurn_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_RightTurn_FuncRefs.mm"
#	include "State_RightTurn_Internal.mm"
}

bool RightTurn::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_RightTurn_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_RightTurn_FuncRefs.mm"

	return
	(
#		include "State_RightTurn_Transition_0.expr"
	);
}
