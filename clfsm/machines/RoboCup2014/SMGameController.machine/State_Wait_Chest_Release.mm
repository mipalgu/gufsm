//
// State_Wait_Chest_Release.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_Wait_Chest_Release.h"

#include "State_Wait_Chest_Release_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

Wait_Chest_Release::Wait_Chest_Release(const char *name): CLState(name, *new Wait_Chest_Release::OnEntry, *new Wait_Chest_Release::OnExit, *new Wait_Chest_Release::Internal)
{
	_transitions[0] = new Transition_0();
}

Wait_Chest_Release::~Wait_Chest_Release()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Wait_Chest_Release::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Wait_Chest_Release_VarRefs.mm"
#	include "State_Wait_Chest_Release_OnEntry.mm"
}

void Wait_Chest_Release::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Wait_Chest_Release_VarRefs.mm"
#	include "State_Wait_Chest_Release_OnExit.mm"
}

void Wait_Chest_Release::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Wait_Chest_Release_VarRefs.mm"
#	include "State_Wait_Chest_Release_Internal.mm"
}

bool Wait_Chest_Release::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Wait_Chest_Release_VarRefs.mm"

	return
	(
#		include "State_Wait_Chest_Release_Transition_0.expr"
	);
}
