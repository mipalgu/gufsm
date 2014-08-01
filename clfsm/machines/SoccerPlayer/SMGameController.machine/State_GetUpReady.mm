//
// State_GetUpReady.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_GetUpReady.h"

#include "State_GetUpReady_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

GetUpReady::GetUpReady(const char *name): CLState(name, *new GetUpReady::OnEntry, *new GetUpReady::OnExit, *new GetUpReady::Internal)
{
	_transitions[0] = new Transition_0();
}

GetUpReady::~GetUpReady()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void GetUpReady::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_GetUpReady_VarRefs.mm"
#	include "State_GetUpReady_OnEntry.mm"
}

void GetUpReady::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_GetUpReady_VarRefs.mm"
#	include "State_GetUpReady_OnExit.mm"
}

void GetUpReady::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_GetUpReady_VarRefs.mm"
#	include "State_GetUpReady_Internal.mm"
}

bool GetUpReady::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_GetUpReady_VarRefs.mm"

	return
	(
#		include "State_GetUpReady_Transition_0.expr"
	);
}
