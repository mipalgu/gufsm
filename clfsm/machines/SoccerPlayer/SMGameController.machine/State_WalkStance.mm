//
// State_WalkStance.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_WalkStance.h"

#include "State_WalkStance_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

WalkStance::WalkStance(const char *name): CLState(name, *new WalkStance::OnEntry, *new WalkStance::OnExit, *new WalkStance::Internal)
{
	_transitions[0] = new Transition_0();
}

WalkStance::~WalkStance()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void WalkStance::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_WalkStance_VarRefs.mm"
#	include "State_WalkStance_OnEntry.mm"
}

void WalkStance::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_WalkStance_VarRefs.mm"
#	include "State_WalkStance_OnExit.mm"
}

void WalkStance::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_WalkStance_VarRefs.mm"
#	include "State_WalkStance_Internal.mm"
}

bool WalkStance::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_WalkStance_VarRefs.mm"

	return
	(
#		include "State_WalkStance_Transition_0.expr"
	);
}
