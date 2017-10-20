//
// State_EndOfTheLine.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_EndOfTheLine.h"

#include "State_EndOfTheLine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

EndOfTheLine::EndOfTheLine(const char *name): CLState(name, *new EndOfTheLine::OnEntry, *new EndOfTheLine::OnExit, *new EndOfTheLine::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

EndOfTheLine::~EndOfTheLine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void EndOfTheLine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_EndOfTheLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_EndOfTheLine_FuncRefs.mm"
#	include "State_EndOfTheLine_OnEntry.mm"
}

void EndOfTheLine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_EndOfTheLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_EndOfTheLine_FuncRefs.mm"
#	include "State_EndOfTheLine_OnExit.mm"
}

void EndOfTheLine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_EndOfTheLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_EndOfTheLine_FuncRefs.mm"
#	include "State_EndOfTheLine_Internal.mm"
}

bool EndOfTheLine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_EndOfTheLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_EndOfTheLine_FuncRefs.mm"

	return
	(
#		include "State_EndOfTheLine_Transition_0.expr"
	);
}
bool EndOfTheLine::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_EndOfTheLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_EndOfTheLine_FuncRefs.mm"

	return
	(
#		include "State_EndOfTheLine_Transition_1.expr"
	);
}
bool EndOfTheLine::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_EndOfTheLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_EndOfTheLine_FuncRefs.mm"

	return
	(
#		include "State_EndOfTheLine_Transition_2.expr"
	);
}
