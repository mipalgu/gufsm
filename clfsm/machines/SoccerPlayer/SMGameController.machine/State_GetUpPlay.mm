//
// State_GetUpPlay.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_GetUpPlay.h"

#include "State_GetUpPlay_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

GetUpPlay::GetUpPlay(const char *name): CLState(name, *new GetUpPlay::OnEntry, *new GetUpPlay::OnExit, *new GetUpPlay::Internal)
{
	_transitions[0] = new Transition_0();
}

GetUpPlay::~GetUpPlay()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void GetUpPlay::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_GetUpPlay_VarRefs.mm"
#	include "State_GetUpPlay_OnEntry.mm"
}

void GetUpPlay::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_GetUpPlay_VarRefs.mm"
#	include "State_GetUpPlay_OnExit.mm"
}

void GetUpPlay::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_GetUpPlay_VarRefs.mm"
#	include "State_GetUpPlay_Internal.mm"
}

bool GetUpPlay::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_GetUpPlay_VarRefs.mm"

	return
	(
#		include "State_GetUpPlay_Transition_0.expr"
	);
}
