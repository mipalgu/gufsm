//
// State_State_2.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_State_2.h"

#include "State_State_2_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

State_2::State_2(const char *name): CLState(name, *new State_2::OnEntry, *new State_2::OnExit, *new State_2::Internal)
{
}

State_2::~State_2()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void State_2::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_State_2_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_State_2_FuncRefs.mm"
#	include "State_State_2_OnEntry.mm"
}

void State_2::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_State_2_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_State_2_FuncRefs.mm"
#	include "State_State_2_OnExit.mm"
}

void State_2::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_State_2_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_State_2_FuncRefs.mm"
#	include "State_State_2_Internal.mm"
}

