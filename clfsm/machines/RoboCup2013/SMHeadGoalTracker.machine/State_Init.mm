//
// State_Init.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadGoalTracker_Includes.h"
#include "SMHeadGoalTracker.h"
#include "State_Init.h"

#include "State_Init_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadGoalTracker;
using namespace State;

Init::Init(const char *name): CLState(name, *new Init::OnEntry, *new Init::OnExit, *new Init::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
	_transitions[3] = new Transition_3();
}

Init::~Init()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
	delete _transitions[3];
}

void Init::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "State_Init_OnEntry.mm"
}

void Init::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "State_Init_OnExit.mm"
}

void Init::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "State_Init_Internal.mm"
}

bool Init::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Init_VarRefs.mm"

	return
	(
#		include "State_Init_Transition_0.expr"
	);
}

bool Init::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Init_VarRefs.mm"

	return
	(
#		include "State_Init_Transition_1.expr"
	);
}

bool Init::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Init_VarRefs.mm"

	return
	(
#		include "State_Init_Transition_2.expr"
	);
}

bool Init::Transition_3::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Init_VarRefs.mm"

	return
	(
#		include "State_Init_Transition_3.expr"
	);
}
