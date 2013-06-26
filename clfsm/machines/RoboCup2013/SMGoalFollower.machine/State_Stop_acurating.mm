//
// State_Stop_acurating.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalFollower_Includes.h"
#include "SMGoalFollower.h"
#include "State_Stop_acurating.h"

#include "State_Stop_acurating_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalFollower;
using namespace State;

Stop_acurating::Stop_acurating(const char *name): CLState(name, *new Stop_acurating::OnEntry, *new Stop_acurating::OnExit, *new Stop_acurating::Internal)
{
	_transitions[0] = new Transition_0();
}

Stop_acurating::~Stop_acurating()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Stop_acurating::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Stop_acurating_VarRefs.mm"
#	include "State_Stop_acurating_OnEntry.mm"
}

void Stop_acurating::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Stop_acurating_VarRefs.mm"
#	include "State_Stop_acurating_OnExit.mm"
}

void Stop_acurating::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Stop_acurating_VarRefs.mm"
#	include "State_Stop_acurating_Internal.mm"
}

bool Stop_acurating::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Stop_acurating_VarRefs.mm"

	return
	(
#		include "State_Stop_acurating_Transition_0.expr"
	);
}
