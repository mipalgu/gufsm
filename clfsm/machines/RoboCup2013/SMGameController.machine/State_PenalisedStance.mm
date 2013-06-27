//
// State_PenalisedStance.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_PenalisedStance.h"

#include "State_PenalisedStance_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

PenalisedStance::PenalisedStance(const char *name): CLState(name, *new PenalisedStance::OnEntry, *new PenalisedStance::OnExit, *new PenalisedStance::Internal)
{
	_transitions[0] = new Transition_0();
}

PenalisedStance::~PenalisedStance()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void PenalisedStance::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_PenalisedStance_VarRefs.mm"
#	include "State_PenalisedStance_OnEntry.mm"
}

void PenalisedStance::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_PenalisedStance_VarRefs.mm"
#	include "State_PenalisedStance_OnExit.mm"
}

void PenalisedStance::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_PenalisedStance_VarRefs.mm"
#	include "State_PenalisedStance_Internal.mm"
}

bool PenalisedStance::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_PenalisedStance_VarRefs.mm"

	return
	(
#		include "State_PenalisedStance_Transition_0.expr"
	);
}
