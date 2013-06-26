//
// State_Third_shot.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_Third_shot.h"

#include "State_Third_shot_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

Third_shot::Third_shot(const char *name): CLState(name, *new Third_shot::OnEntry, *new Third_shot::OnExit, *new Third_shot::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Third_shot::~Third_shot()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Third_shot::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_shot_VarRefs.mm"
#	include "State_Third_shot_OnEntry.mm"
}

void Third_shot::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_shot_VarRefs.mm"
#	include "State_Third_shot_OnExit.mm"
}

void Third_shot::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_shot_VarRefs.mm"
#	include "State_Third_shot_Internal.mm"
}

bool Third_shot::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_shot_VarRefs.mm"

	return
	(
#		include "State_Third_shot_Transition_0.expr"
	);
}

bool Third_shot::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_shot_VarRefs.mm"

	return
	(
#		include "State_Third_shot_Transition_1.expr"
	);
}
