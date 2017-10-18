//
// State_TCross.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_TCross.h"

#include "State_TCross_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

TCross::TCross(const char *name): CLState(name, *new TCross::OnEntry, *new TCross::OnExit, *new TCross::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

TCross::~TCross()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void TCross::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TCross_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TCross_FuncRefs.mm"
#	include "State_TCross_OnEntry.mm"
}

void TCross::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TCross_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TCross_FuncRefs.mm"
#	include "State_TCross_OnExit.mm"
}

void TCross::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TCross_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TCross_FuncRefs.mm"
#	include "State_TCross_Internal.mm"
}

bool TCross::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TCross_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TCross_FuncRefs.mm"

	return
	(
#		include "State_TCross_Transition_0.expr"
	);
}
bool TCross::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_TCross_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_TCross_FuncRefs.mm"

	return
	(
#		include "State_TCross_Transition_1.expr"
	);
}
