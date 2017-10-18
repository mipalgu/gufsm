//
// State_CalcRight.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_CalcRight.h"

#include "State_CalcRight_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

CalcRight::CalcRight(const char *name): CLState(name, *new CalcRight::OnEntry, *new CalcRight::OnExit, *new CalcRight::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CalcRight::~CalcRight()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void CalcRight::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_CalcRight_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_CalcRight_FuncRefs.mm"
#	include "State_CalcRight_OnEntry.mm"
}

void CalcRight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_CalcRight_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_CalcRight_FuncRefs.mm"
#	include "State_CalcRight_OnExit.mm"
}

void CalcRight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_CalcRight_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_CalcRight_FuncRefs.mm"
#	include "State_CalcRight_Internal.mm"
}

bool CalcRight::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_CalcRight_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_CalcRight_FuncRefs.mm"

	return
	(
#		include "State_CalcRight_Transition_0.expr"
	);
}
bool CalcRight::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_CalcRight_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_CalcRight_FuncRefs.mm"

	return
	(
#		include "State_CalcRight_Transition_1.expr"
	);
}
