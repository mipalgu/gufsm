//
// State_StopState.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_StopState.h"

#include "State_StopState_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

StopState::StopState(const char *name): CLState(name, *new StopState::OnEntry, *new StopState::OnExit, *new StopState::Internal)
{
}

StopState::~StopState()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void StopState::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_StopState_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_StopState_FuncRefs.mm"
#	include "State_StopState_OnEntry.mm"
}

void StopState::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_StopState_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_StopState_FuncRefs.mm"
#	include "State_StopState_OnExit.mm"
}

void StopState::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_StopState_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_StopState_FuncRefs.mm"
#	include "State_StopState_Internal.mm"
}

