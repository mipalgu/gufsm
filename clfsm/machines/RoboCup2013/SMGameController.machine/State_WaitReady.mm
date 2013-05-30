//
// State_WaitReady.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_WaitReady.h"

#include "State_WaitReady_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

WaitReady::WaitReady(const char *name): CLState(name, *new WaitReady::OnEntry, *new WaitReady::OnExit, *new WaitReady::Internal)
{
	_transitions[0] = new Transition_0();
}

WaitReady::~WaitReady()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void WaitReady::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_WaitReady_VarRefs.mm"
#	include "State_WaitReady_OnEntry.mm"
}

void WaitReady::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_WaitReady_VarRefs.mm"
#	include "State_WaitReady_OnExit.mm"
}

void WaitReady::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_WaitReady_VarRefs.mm"
#	include "State_WaitReady_Internal.mm"
}

bool WaitReady::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_WaitReady_VarRefs.mm"

	return
	(
#		include "State_WaitReady_Transition_0.expr"
	);
}
