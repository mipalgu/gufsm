//
// State_Landmark.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_Landmark.h"

#include "State_Landmark_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

Landmark::Landmark(const char *name): CLState(name, *new Landmark::OnEntry, *new Landmark::OnExit, *new Landmark::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
	_transitions[3] = new Transition_3();
	_transitions[4] = new Transition_4();
	_transitions[5] = new Transition_5();
}

Landmark::~Landmark()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
	delete _transitions[3];
	delete _transitions[4];
	delete _transitions[5];
}

void Landmark::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Landmark_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Landmark_FuncRefs.mm"
#	include "State_Landmark_OnEntry.mm"
}

void Landmark::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Landmark_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Landmark_FuncRefs.mm"
#	include "State_Landmark_OnExit.mm"
}

void Landmark::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Landmark_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Landmark_FuncRefs.mm"
#	include "State_Landmark_Internal.mm"
}

bool Landmark::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Landmark_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Landmark_FuncRefs.mm"

	return
	(
#		include "State_Landmark_Transition_0.expr"
	);
}
bool Landmark::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Landmark_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Landmark_FuncRefs.mm"

	return
	(
#		include "State_Landmark_Transition_1.expr"
	);
}
bool Landmark::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Landmark_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Landmark_FuncRefs.mm"

	return
	(
#		include "State_Landmark_Transition_2.expr"
	);
}
bool Landmark::Transition_3::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Landmark_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Landmark_FuncRefs.mm"

	return
	(
#		include "State_Landmark_Transition_3.expr"
	);
}
bool Landmark::Transition_4::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Landmark_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Landmark_FuncRefs.mm"

	return
	(
#		include "State_Landmark_Transition_4.expr"
	);
}
bool Landmark::Transition_5::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Landmark_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Landmark_FuncRefs.mm"

	return
	(
#		include "State_Landmark_Transition_5.expr"
	);
}
