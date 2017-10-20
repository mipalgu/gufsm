//
// State_TestTurn.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_TestTurn.h"

#include "State_TestTurn_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

TestTurn::TestTurn(const char *name): CLState(name, *new TestTurn::OnEntry, *new TestTurn::OnExit, *new TestTurn::Internal)
{
	_transitions[0] = new Transition_0();
}

TestTurn::~TestTurn()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void TestTurn::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestTurn_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestTurn_FuncRefs.mm"
#	include "State_TestTurn_OnEntry.mm"
}

void TestTurn::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestTurn_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestTurn_FuncRefs.mm"
#	include "State_TestTurn_OnExit.mm"
}

void TestTurn::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestTurn_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestTurn_FuncRefs.mm"
#	include "State_TestTurn_Internal.mm"
}

bool TestTurn::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TestTurn_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TestTurn_FuncRefs.mm"

	return
	(
#		include "State_TestTurn_Transition_0.expr"
	);
}
