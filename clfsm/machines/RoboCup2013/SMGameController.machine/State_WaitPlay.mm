//
// State_WaitPlay.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_WaitPlay.h"

#include "State_WaitPlay_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

WaitPlay::WaitPlay(const char *name): CLState(name, *new WaitPlay::OnEntry, *new WaitPlay::OnExit, *new WaitPlay::Internal)
{
	_transitions[0] = new Transition_0();
}

WaitPlay::~WaitPlay()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void WaitPlay::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_WaitPlay_VarRefs.mm"
#	include "State_WaitPlay_OnEntry.mm"
}

void WaitPlay::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_WaitPlay_VarRefs.mm"
#	include "State_WaitPlay_OnExit.mm"
}

void WaitPlay::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_WaitPlay_VarRefs.mm"
#	include "State_WaitPlay_Internal.mm"
}

bool WaitPlay::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_WaitPlay_VarRefs.mm"

	return
	(
#		include "State_WaitPlay_Transition_0.expr"
	);
}
