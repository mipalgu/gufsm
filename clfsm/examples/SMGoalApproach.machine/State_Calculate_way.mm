//
// State_Calculate_way.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalApproach_Includes.h"
#include "SMGoalApproach.h"
#include "State_Calculate_way.h"

#include "State_Calculate_way_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalApproach;
using namespace State;

Calculate_way::Calculate_way(const char *name): CLState(name, *new Calculate_way::OnEntry, *new Calculate_way::OnExit, *new Calculate_way::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

Calculate_way::~Calculate_way()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void Calculate_way::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Calculate_way_VarRefs.mm"
#	include "State_Calculate_way_OnEntry.mm"
}

void Calculate_way::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Calculate_way_VarRefs.mm"
#	include "State_Calculate_way_OnExit.mm"
}

void Calculate_way::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Calculate_way_VarRefs.mm"
#	include "State_Calculate_way_Internal.mm"
}

bool Calculate_way::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Calculate_way_VarRefs.mm"

	return
	(
#		include "State_Calculate_way_Transition_0.expr"
	);
}

bool Calculate_way::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Calculate_way_VarRefs.mm"

	return
	(
#		include "State_Calculate_way_Transition_1.expr"
	);
}

bool Calculate_way::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Calculate_way_VarRefs.mm"

	return
	(
#		include "State_Calculate_way_Transition_2.expr"
	);
}
