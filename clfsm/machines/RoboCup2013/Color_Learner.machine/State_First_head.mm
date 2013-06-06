//
// State_First_head.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_First_head.h"

#include "State_First_head_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

First_head::First_head(const char *name): CLState(name, *new First_head::OnEntry, *new First_head::OnExit, *new First_head::Internal)
{
	_transitions[0] = new Transition_0();
}

First_head::~First_head()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void First_head::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_head_VarRefs.mm"
#	include "State_First_head_OnEntry.mm"
}

void First_head::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_head_VarRefs.mm"
#	include "State_First_head_OnExit.mm"
}

void First_head::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_head_VarRefs.mm"
#	include "State_First_head_Internal.mm"
}

bool First_head::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_head_VarRefs.mm"

	return
	(
#		include "State_First_head_Transition_0.expr"
	);
}
