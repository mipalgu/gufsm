//
// State_Initial.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_Initial.h"

#include "State_Initial_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

Initial::Initial(const char *name): CLState(name, *new Initial::OnEntry, *new Initial::OnExit, *new Initial::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
	_transitions[3] = new Transition_3();
	_transitions[4] = new Transition_4();
}

Initial::~Initial()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
	delete _transitions[3];
	delete _transitions[4];
}

void Initial::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnEntry.mm"
}

void Initial::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnExit.mm"
}

void Initial::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_Internal.mm"
}

bool Initial::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_0.expr"
	);
}
bool Initial::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_1.expr"
	);
}
bool Initial::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_2.expr"
	);
}
bool Initial::Transition_3::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_3.expr"
	);
}
bool Initial::Transition_4::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_4.expr"
	);
}
