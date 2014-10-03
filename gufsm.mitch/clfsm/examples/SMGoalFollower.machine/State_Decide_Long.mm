//
// State_Decide_Long.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalFollower_Includes.h"
#include "SMGoalFollower.h"
#include "State_Decide_Long.h"

#include "State_Decide_Long_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalFollower;
using namespace State;

Decide_Long::Decide_Long(const char *name): CLState(name, *new Decide_Long::OnEntry, *new Decide_Long::OnExit, *new Decide_Long::Internal)
{
	_transitions[0] = new Transition_0();
}

Decide_Long::~Decide_Long()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Decide_Long::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Decide_Long_VarRefs.mm"
#	include "State_Decide_Long_OnEntry.mm"
}

void Decide_Long::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Decide_Long_VarRefs.mm"
#	include "State_Decide_Long_OnExit.mm"
}

void Decide_Long::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Decide_Long_VarRefs.mm"
#	include "State_Decide_Long_Internal.mm"
}

bool Decide_Long::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Decide_Long_VarRefs.mm"

	return
	(
#		include "State_Decide_Long_Transition_0.expr"
	);
}
