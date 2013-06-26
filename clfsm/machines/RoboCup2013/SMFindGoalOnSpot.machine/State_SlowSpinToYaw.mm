//
// State_SlowSpinToYaw.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMFindGoalOnSpot_Includes.h"
#include "SMFindGoalOnSpot.h"
#include "State_SlowSpinToYaw.h"

#include "State_SlowSpinToYaw_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMFindGoalOnSpot;
using namespace State;

SlowSpinToYaw::SlowSpinToYaw(const char *name): CLState(name, *new SlowSpinToYaw::OnEntry, *new SlowSpinToYaw::OnExit, *new SlowSpinToYaw::Internal)
{
	_transitions[0] = new Transition_0();
}

SlowSpinToYaw::~SlowSpinToYaw()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SlowSpinToYaw::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_SlowSpinToYaw_VarRefs.mm"
#	include "State_SlowSpinToYaw_OnEntry.mm"
}

void SlowSpinToYaw::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_SlowSpinToYaw_VarRefs.mm"
#	include "State_SlowSpinToYaw_OnExit.mm"
}

void SlowSpinToYaw::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_SlowSpinToYaw_VarRefs.mm"
#	include "State_SlowSpinToYaw_Internal.mm"
}

bool SlowSpinToYaw::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_SlowSpinToYaw_VarRefs.mm"

	return
	(
#		include "State_SlowSpinToYaw_Transition_0.expr"
	);
}
