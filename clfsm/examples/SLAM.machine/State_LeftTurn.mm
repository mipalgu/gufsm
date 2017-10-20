//
// State_LeftTurn.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_LeftTurn.h"

#include "State_LeftTurn_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

LeftTurn::LeftTurn(const char *name): CLState(name, *new LeftTurn::OnEntry, *new LeftTurn::OnExit, *new LeftTurn::Internal)
{
	_transitions[0] = new Transition_0();
}

LeftTurn::~LeftTurn()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void LeftTurn::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_LeftTurn_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_LeftTurn_FuncRefs.mm"
#	include "State_LeftTurn_OnEntry.mm"
}

void LeftTurn::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_LeftTurn_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_LeftTurn_FuncRefs.mm"
#	include "State_LeftTurn_OnExit.mm"
}

void LeftTurn::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_LeftTurn_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_LeftTurn_FuncRefs.mm"
#	include "State_LeftTurn_Internal.mm"
}

bool LeftTurn::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_LeftTurn_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_LeftTurn_FuncRefs.mm"

	return
	(
#		include "State_LeftTurn_Transition_0.expr"
	);
}
