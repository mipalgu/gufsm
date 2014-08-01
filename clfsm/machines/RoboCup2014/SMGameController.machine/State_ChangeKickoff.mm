//
// State_ChangeKickoff.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_ChangeKickoff.h"

#include "State_ChangeKickoff_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

ChangeKickoff::ChangeKickoff(const char *name): CLState(name, *new ChangeKickoff::OnEntry, *new ChangeKickoff::OnExit, *new ChangeKickoff::Internal)
{
	_transitions[0] = new Transition_0();
}

ChangeKickoff::~ChangeKickoff()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ChangeKickoff::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_ChangeKickoff_VarRefs.mm"
#	include "State_ChangeKickoff_OnEntry.mm"
}

void ChangeKickoff::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_ChangeKickoff_VarRefs.mm"
#	include "State_ChangeKickoff_OnExit.mm"
}

void ChangeKickoff::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_ChangeKickoff_VarRefs.mm"
#	include "State_ChangeKickoff_Internal.mm"
}

bool ChangeKickoff::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_ChangeKickoff_VarRefs.mm"

	return
	(
#		include "State_ChangeKickoff_Transition_0.expr"
	);
}
