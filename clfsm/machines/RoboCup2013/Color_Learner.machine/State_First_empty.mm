//
// State_First_empty.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_First_empty.h"

#include "State_First_empty_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

First_empty::First_empty(const char *name): CLState(name, *new First_empty::OnEntry, *new First_empty::OnExit, *new First_empty::Internal)
{
	_transitions[0] = new Transition_0();
}

First_empty::~First_empty()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void First_empty::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_empty_VarRefs.mm"
#	include "State_First_empty_OnEntry.mm"
}

void First_empty::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_empty_VarRefs.mm"
#	include "State_First_empty_OnExit.mm"
}

void First_empty::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_empty_VarRefs.mm"
#	include "State_First_empty_Internal.mm"
}

bool First_empty::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_empty_VarRefs.mm"

	return
	(
#		include "State_First_empty_Transition_0.expr"
	);
}
