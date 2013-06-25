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

TurnToGoal::TurnToGoal(const char *name): CLState(name, *new TurnToGoal::OnEntry, *new TurnToGoal::OnExit, *new TurnToGoal::Internal)
{
	_transitions[0] = new Transition_0();
}

TurnToGoal::~TurnToGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void TurnToGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_TurnToGoal_VarRefs.mm"
#	include "State_TurnToGoal_OnEntry.mm"
}

void TurnToGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_TurnToGoal_VarRefs.mm"
#	include "State_TurnToGoal_OnExit.mm"
}

void TurnToGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_TurnToGoal_VarRefs.mm"
#	include "State_TurnToGoal_Internal.mm"
}

bool TurnToGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_TurnToGoal_VarRefs.mm"

	return
	(
#		include "State_TurnToGoal_Transition_0.expr"
	);
}
