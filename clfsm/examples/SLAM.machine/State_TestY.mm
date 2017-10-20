//
// State_TestY.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_TestY.h"

#include "State_TestY_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

TestY::TestY(const char *name): CLState(name, *new TestY::OnEntry, *new TestY::OnExit, *new TestY::Internal)
{
	_transitions[0] = new Transition_0();
}

TestY::~TestY()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void TestY::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestY_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestY_FuncRefs.mm"
#	include "State_TestY_OnEntry.mm"
}

void TestY::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestY_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestY_FuncRefs.mm"
#	include "State_TestY_OnExit.mm"
}

void TestY::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestY_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestY_FuncRefs.mm"
#	include "State_TestY_Internal.mm"
}

bool TestY::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestY_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestY_FuncRefs.mm"

	return
	(
#		include "State_TestY_Transition_0.expr"
	);
}
