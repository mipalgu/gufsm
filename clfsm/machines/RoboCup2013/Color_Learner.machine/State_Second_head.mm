//
// State_Second_head.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_Second_head.h"

#include "State_Second_head_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

Second_head::Second_head(const char *name): CLState(name, *new Second_head::OnEntry, *new Second_head::OnExit, *new Second_head::Internal)
{
	_transitions[0] = new Transition_0();
}

Second_head::~Second_head()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Second_head::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_head_VarRefs.mm"
#	include "State_Second_head_OnEntry.mm"
}

void Second_head::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_head_VarRefs.mm"
#	include "State_Second_head_OnExit.mm"
}

void Second_head::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_head_VarRefs.mm"
#	include "State_Second_head_Internal.mm"
}

bool Second_head::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Second_head_VarRefs.mm"

	return
	(
#		include "State_Second_head_Transition_0.expr"
	);
}
