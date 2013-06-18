//
// State_Align_body.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalApproach_Includes.h"
#include "SMGoalApproach.h"
#include "State_Align_body.h"

#include "State_Align_body_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalApproach;
using namespace State;

Align_body::Align_body(const char *name): CLState(name, *new Align_body::OnEntry, *new Align_body::OnExit, *new Align_body::Internal)
{
	_transitions[0] = new Transition_0();
}

Align_body::~Align_body()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Align_body::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Align_body_VarRefs.mm"
#	include "State_Align_body_OnEntry.mm"
}

void Align_body::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Align_body_VarRefs.mm"
#	include "State_Align_body_OnExit.mm"
}

void Align_body::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Align_body_VarRefs.mm"
#	include "State_Align_body_Internal.mm"
}

bool Align_body::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Align_body_VarRefs.mm"

	return
	(
#		include "State_Align_body_Transition_0.expr"
	);
}
