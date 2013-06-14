//
// State_Third_head.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_Third_head.h"

#include "State_Third_head_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

Third_head::Third_head(const char *name): CLState(name, *new Third_head::OnEntry, *new Third_head::OnExit, *new Third_head::Internal)
{
	_transitions[0] = new Transition_0();
}

Third_head::~Third_head()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Third_head::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_head_VarRefs.mm"
#	include "State_Third_head_OnEntry.mm"
}

void Third_head::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_head_VarRefs.mm"
#	include "State_Third_head_OnExit.mm"
}

void Third_head::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_head_VarRefs.mm"
#	include "State_Third_head_Internal.mm"
}

bool Third_head::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Third_head_VarRefs.mm"

	return
	(
#		include "State_Third_head_Transition_0.expr"
	);
}
