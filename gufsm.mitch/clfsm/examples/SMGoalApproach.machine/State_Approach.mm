//
// State_Approach.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalApproach_Includes.h"
#include "SMGoalApproach.h"
#include "State_Approach.h"

#include "State_Approach_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalApproach;
using namespace State;

Approach::Approach(const char *name): CLState(name, *new Approach::OnEntry, *new Approach::OnExit, *new Approach::Internal)
{
	_transitions[0] = new Transition_0();
}

Approach::~Approach()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Approach::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Approach_VarRefs.mm"
#	include "State_Approach_OnEntry.mm"
}

void Approach::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Approach_VarRefs.mm"
#	include "State_Approach_OnExit.mm"
}

void Approach::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Approach_VarRefs.mm"
#	include "State_Approach_Internal.mm"
}

bool Approach::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Approach_VarRefs.mm"

	return
	(
#		include "State_Approach_Transition_0.expr"
	);
}
