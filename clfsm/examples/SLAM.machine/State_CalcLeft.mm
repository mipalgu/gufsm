//
// State_CalcLeft.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_CalcLeft.h"

#include "State_CalcLeft_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

CalcLeft::CalcLeft(const char *name): CLState(name, *new CalcLeft::OnEntry, *new CalcLeft::OnExit, *new CalcLeft::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CalcLeft::~CalcLeft()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void CalcLeft::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_CalcLeft_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_CalcLeft_FuncRefs.mm"
#	include "State_CalcLeft_OnEntry.mm"
}

void CalcLeft::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_CalcLeft_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_CalcLeft_FuncRefs.mm"
#	include "State_CalcLeft_OnExit.mm"
}

void CalcLeft::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_CalcLeft_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_CalcLeft_FuncRefs.mm"
#	include "State_CalcLeft_Internal.mm"
}

bool CalcLeft::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_CalcLeft_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_CalcLeft_FuncRefs.mm"

	return
	(
#		include "State_CalcLeft_Transition_0.expr"
	);
}
bool CalcLeft::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_CalcLeft_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_CalcLeft_FuncRefs.mm"

	return
	(
#		include "State_CalcLeft_Transition_1.expr"
	);
}
