//
// State_OdometryTestState.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_OdometryTestState.h"

#include "State_OdometryTestState_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

OdometryTestState::OdometryTestState(const char *name): CLState(name, *new OdometryTestState::OnEntry, *new OdometryTestState::OnExit, *new OdometryTestState::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

OdometryTestState::~OdometryTestState()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void OdometryTestState::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_OdometryTestState_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_OdometryTestState_FuncRefs.mm"
#	include "State_OdometryTestState_OnEntry.mm"
}

void OdometryTestState::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_OdometryTestState_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_OdometryTestState_FuncRefs.mm"
#	include "State_OdometryTestState_OnExit.mm"
}

void OdometryTestState::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_OdometryTestState_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_OdometryTestState_FuncRefs.mm"
#	include "State_OdometryTestState_Internal.mm"
}

bool OdometryTestState::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_OdometryTestState_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_OdometryTestState_FuncRefs.mm"

	return
	(
#		include "State_OdometryTestState_Transition_0.expr"
	);
}
bool OdometryTestState::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_OdometryTestState_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_OdometryTestState_FuncRefs.mm"

	return
	(
#		include "State_OdometryTestState_Transition_1.expr"
	);
}
