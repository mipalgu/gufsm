//
// State_Set.mm -- 2013-05-13 03:32:49 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "GameController_Includes.h"
#include "GameController.h"
#include "State_Set.h"

#include "State_Set_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMGameController;
using namespace State;

Set::Set(const char *name): CLState(name, *new Set::OnEntry, *new Set::OnExit, *new Set::Internal)
{
	_transitions[0] = new Transition_0();
}

Set::~Set()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Set::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Set_VarRefs.mm"
#	include "State_Set_OnEntry.mm"
}

void Set::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Set_VarRefs.mm"
#	include "State_Set_OnExit.mm"
}

void Set::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Set_VarRefs.mm"
#	include "State_Set_Internal.mm"
}

bool Set::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Set_VarRefs.mm"

	return
	(
#		include "State_Set_Transition_0.expr"
	);
}
