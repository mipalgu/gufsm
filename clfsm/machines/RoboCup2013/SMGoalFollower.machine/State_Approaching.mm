//
// State_Approaching.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalFollower_Includes.h"
#include "SMGoalFollower.h"
#include "State_Approaching.h"

#include "State_Approaching_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalFollower;
using namespace State;

Approaching::Approaching(const char *name): CLState(name, *new Approaching::OnEntry, *new Approaching::OnExit, *new Approaching::Internal)
{
	_transitions[0] = new Transition_0();
}

Approaching::~Approaching()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Approaching::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Approaching_VarRefs.mm"
#	include "State_Approaching_OnEntry.mm"
}

void Approaching::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Approaching_VarRefs.mm"
#	include "State_Approaching_OnExit.mm"
}

void Approaching::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Approaching_VarRefs.mm"
#	include "State_Approaching_Internal.mm"
}

bool Approaching::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Approaching_VarRefs.mm"

	return
	(
#		include "State_Approaching_Transition_0.expr"
	);
}
