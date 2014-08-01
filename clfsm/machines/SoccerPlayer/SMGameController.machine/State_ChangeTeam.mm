//
// State_ChangeTeam.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_ChangeTeam.h"

#include "State_ChangeTeam_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

ChangeTeam::ChangeTeam(const char *name): CLState(name, *new ChangeTeam::OnEntry, *new ChangeTeam::OnExit, *new ChangeTeam::Internal)
{
	_transitions[0] = new Transition_0();
}

ChangeTeam::~ChangeTeam()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ChangeTeam::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_ChangeTeam_VarRefs.mm"
#	include "State_ChangeTeam_OnEntry.mm"
}

void ChangeTeam::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_ChangeTeam_VarRefs.mm"
#	include "State_ChangeTeam_OnExit.mm"
}

void ChangeTeam::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_ChangeTeam_VarRefs.mm"
#	include "State_ChangeTeam_Internal.mm"
}

bool ChangeTeam::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_ChangeTeam_VarRefs.mm"

	return
	(
#		include "State_ChangeTeam_Transition_0.expr"
	);
}
