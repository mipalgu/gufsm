//
// State_Debounce.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_Debounce.h"

#include "State_Debounce_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

Debounce::Debounce(const char *name): CLState(name, *new Debounce::OnEntry, *new Debounce::OnExit, *new Debounce::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Debounce::~Debounce()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Debounce::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Debounce_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Debounce_FuncRefs.mm"
#	include "State_Debounce_OnEntry.mm"
}

void Debounce::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Debounce_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Debounce_FuncRefs.mm"
#	include "State_Debounce_OnExit.mm"
}

void Debounce::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Debounce_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Debounce_FuncRefs.mm"
#	include "State_Debounce_Internal.mm"
}

bool Debounce::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Debounce_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Debounce_FuncRefs.mm"

	return
	(
#		include "State_Debounce_Transition_0.expr"
	);
}
bool Debounce::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Debounce_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Debounce_FuncRefs.mm"

	return
	(
#		include "State_Debounce_Transition_1.expr"
	);
}
