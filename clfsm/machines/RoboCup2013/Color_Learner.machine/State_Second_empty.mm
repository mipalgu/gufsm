//
// State_Second_empty.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_Second_empty.h"

#include "State_Second_empty_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

Second_empty::Second_empty(const char *name): CLState(name, *new Second_empty::OnEntry, *new Second_empty::OnExit, *new Second_empty::Internal)
{
	_transitions[0] = new Transition_0();
}

Second_empty::~Second_empty()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Second_empty::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_empty_VarRefs.mm"
#	include "State_Second_empty_OnEntry.mm"
}

void Second_empty::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_empty_VarRefs.mm"
#	include "State_Second_empty_OnExit.mm"
}

void Second_empty::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_empty_VarRefs.mm"
#	include "State_Second_empty_Internal.mm"
}

bool Second_empty::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_empty_VarRefs.mm"

	return
	(
#		include "State_Second_empty_Transition_0.expr"
	);
}
