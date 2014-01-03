//
// State_TurnToGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_TurnToGoal.h"

#include "State_TurnToGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

(null)::(null)(const char *name): CLState(name, *new (null)::OnEntry, *new (null)::OnExit, *new (null)::Internal)
{
	_transitions[0] = new Transition_0();
}

(null)::~(null)()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void (null)::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_TurnToGoal_VarRefs.mm"
#	include "State_TurnToGoal_OnEntry.mm"
}

void (null)::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_TurnToGoal_VarRefs.mm"
#	include "State_TurnToGoal_OnExit.mm"
}

void (null)::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_TurnToGoal_VarRefs.mm"
#	include "State_TurnToGoal_Internal.mm"
}

bool (null)::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_TurnToGoal_VarRefs.mm"

	return
	(
#		include "State_TurnToGoal_Transition_0.expr"
	);
}
