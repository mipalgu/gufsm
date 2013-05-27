//
// State_OurGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_OurGoal.h"

#include "State_OurGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

OurGoal::OurGoal(const char *name): CLState(name, *new OurGoal::OnEntry, *new OurGoal::OnExit, *new OurGoal::Internal)
{
	_transitions[0] = new Transition_0();
}

OurGoal::~OurGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void OurGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_OurGoal_VarRefs.mm"
#	include "State_OurGoal_OnEntry.mm"
}

void OurGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_OurGoal_VarRefs.mm"
#	include "State_OurGoal_OnExit.mm"
}

void OurGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_OurGoal_VarRefs.mm"
#	include "State_OurGoal_Internal.mm"
}

bool OurGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_OurGoal_VarRefs.mm"

	return
	(
#		include "State_OurGoal_Transition_0.expr"
	);
}
