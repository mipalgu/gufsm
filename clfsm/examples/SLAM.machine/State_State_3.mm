//
// State_State_3.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_State_3.h"

#include "State_State_3_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

State_3::State_3(const char *name): CLState(name, *new State_3::OnEntry, *new State_3::OnExit, *new State_3::Internal)
{
}

State_3::~State_3()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void State_3::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_State_3_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_State_3_FuncRefs.mm"
#	include "State_State_3_OnEntry.mm"
}

void State_3::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_State_3_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_State_3_FuncRefs.mm"
#	include "State_State_3_OnExit.mm"
}

void State_3::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_State_3_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_State_3_FuncRefs.mm"
#	include "State_State_3_Internal.mm"
}

