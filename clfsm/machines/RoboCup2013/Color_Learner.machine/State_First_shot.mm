//
// State_First_shot.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_First_shot.h"

#include "State_First_shot_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

First_shot::First_shot(const char *name): CLState(name, *new First_shot::OnEntry, *new First_shot::OnExit, *new First_shot::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

First_shot::~First_shot()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void First_shot::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_shot_VarRefs.mm"
#	include "State_First_shot_OnEntry.mm"
}

void First_shot::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_shot_VarRefs.mm"
#	include "State_First_shot_OnExit.mm"
}

void First_shot::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_shot_VarRefs.mm"
#	include "State_First_shot_Internal.mm"
}

bool First_shot::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_shot_VarRefs.mm"

	return
	(
#		include "State_First_shot_Transition_0.expr"
	);
}

bool First_shot::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_shot_VarRefs.mm"

	return
	(
#		include "State_First_shot_Transition_1.expr"
	);
}

bool First_shot::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_shot_VarRefs.mm"

	return
	(
#		include "State_First_shot_Transition_2.expr"
	);
}
