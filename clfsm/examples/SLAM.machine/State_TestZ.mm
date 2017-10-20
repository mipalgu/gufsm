//
// State_TestZ.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_TestZ.h"

#include "State_TestZ_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

TestZ::TestZ(const char *name): CLState(name, *new TestZ::OnEntry, *new TestZ::OnExit, *new TestZ::Internal)
{
	_transitions[0] = new Transition_0();
}

TestZ::~TestZ()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void TestZ::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestZ_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestZ_FuncRefs.mm"
#	include "State_TestZ_OnEntry.mm"
}

void TestZ::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestZ_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestZ_FuncRefs.mm"
#	include "State_TestZ_OnExit.mm"
}

void TestZ::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestZ_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestZ_FuncRefs.mm"
#	include "State_TestZ_Internal.mm"
}

bool TestZ::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestZ_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestZ_FuncRefs.mm"

	return
	(
#		include "State_TestZ_Transition_0.expr"
	);
}
