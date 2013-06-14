//
// State_Second_shot.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_Second_shot.h"

#include "State_Second_shot_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

Second_shot::Second_shot(const char *name): CLState(name, *new Second_shot::OnEntry, *new Second_shot::OnExit, *new Second_shot::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Second_shot::~Second_shot()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Second_shot::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_shot_VarRefs.mm"
#	include "State_Second_shot_OnEntry.mm"
}

void Second_shot::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_shot_VarRefs.mm"
#	include "State_Second_shot_OnExit.mm"
}

void Second_shot::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_shot_VarRefs.mm"
#	include "State_Second_shot_Internal.mm"
}

bool Second_shot::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_shot_VarRefs.mm"

	return
	(
#		include "State_Second_shot_Transition_0.expr"
	);
}

bool Second_shot::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_shot_VarRefs.mm"

	return
	(
#		include "State_Second_shot_Transition_1.expr"
	);
}
