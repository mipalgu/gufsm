//
// State_Third_empty.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_Third_empty.h"

#include "State_Third_empty_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

Third_empty::Third_empty(const char *name): CLState(name, *new Third_empty::OnEntry, *new Third_empty::OnExit, *new Third_empty::Internal)
{
	_transitions[0] = new Transition_0();
}

Third_empty::~Third_empty()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Third_empty::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_empty_VarRefs.mm"
#	include "State_Third_empty_OnEntry.mm"
}

void Third_empty::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_empty_VarRefs.mm"
#	include "State_Third_empty_OnExit.mm"
}

void Third_empty::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_empty_VarRefs.mm"
#	include "State_Third_empty_Internal.mm"
}

bool Third_empty::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_empty_VarRefs.mm"

	return
	(
#		include "State_Third_empty_Transition_0.expr"
	);
}
