//
// State_Set.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_Set.h"

#include "State_Set_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

Set::Set(const char *name): CLState(name, *new Set::OnEntry, *new Set::OnExit, *new Set::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

Set::~Set()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void Set::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Set_VarRefs.mm"
#	include "State_Set_OnEntry.mm"
}

void Set::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Set_VarRefs.mm"
#	include "State_Set_OnExit.mm"
}

void Set::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Set_VarRefs.mm"
#	include "State_Set_Internal.mm"
}

bool Set::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Set_VarRefs.mm"

	return
	(
#		include "State_Set_Transition_0.expr"
	);
}

bool Set::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Set_VarRefs.mm"

	return
	(
#		include "State_Set_Transition_1.expr"
	);
}

bool Set::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Set_VarRefs.mm"

	return
	(
#		include "State_Set_Transition_2.expr"
	);
}
