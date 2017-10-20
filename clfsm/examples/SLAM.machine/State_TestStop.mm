//
// State_TestStop.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_TestStop.h"

#include "State_TestStop_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

TestStop::TestStop(const char *name): CLState(name, *new TestStop::OnEntry, *new TestStop::OnExit, *new TestStop::Internal)
{
}

TestStop::~TestStop()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void TestStop::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestStop_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestStop_FuncRefs.mm"
#	include "State_TestStop_OnEntry.mm"
}

void TestStop::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestStop_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestStop_FuncRefs.mm"
#	include "State_TestStop_OnExit.mm"
}

void TestStop::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestStop_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestStop_FuncRefs.mm"
#	include "State_TestStop_Internal.mm"
}

