//
// State_Nothing.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadGoalTracker_Includes.h"
#include "SMHeadGoalTracker.h"
#include "State_Nothing.h"

#include "State_Nothing_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadGoalTracker;
using namespace State;

Nothing::Nothing(const char *name): CLState(name, *new Nothing::OnEntry, *new Nothing::OnExit, *new Nothing::Internal)
{
	_transitions[0] = new Transition_0();
}

Nothing::~Nothing()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Nothing::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Nothing_VarRefs.mm"
#	include "State_Nothing_OnEntry.mm"
}

void Nothing::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Nothing_VarRefs.mm"
#	include "State_Nothing_OnExit.mm"
}

void Nothing::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Nothing_VarRefs.mm"
#	include "State_Nothing_Internal.mm"
}

bool Nothing::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Nothing_VarRefs.mm"

	return
	(
#		include "State_Nothing_Transition_0.expr"
	);
}
