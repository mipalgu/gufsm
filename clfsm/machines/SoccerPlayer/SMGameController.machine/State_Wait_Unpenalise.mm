//
// State_Wait_Unpenalise.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_Wait_Unpenalise.h"

#include "State_Wait_Unpenalise_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

Wait_Unpenalise::Wait_Unpenalise(const char *name): CLState(name, *new Wait_Unpenalise::OnEntry, *new Wait_Unpenalise::OnExit, *new Wait_Unpenalise::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Wait_Unpenalise::~Wait_Unpenalise()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Wait_Unpenalise::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Wait_Unpenalise_VarRefs.mm"
#	include "State_Wait_Unpenalise_OnEntry.mm"
}

void Wait_Unpenalise::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Wait_Unpenalise_VarRefs.mm"
#	include "State_Wait_Unpenalise_OnExit.mm"
}

void Wait_Unpenalise::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Wait_Unpenalise_VarRefs.mm"
#	include "State_Wait_Unpenalise_Internal.mm"
}

bool Wait_Unpenalise::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Wait_Unpenalise_VarRefs.mm"

	return
	(
#		include "State_Wait_Unpenalise_Transition_0.expr"
	);
}

bool Wait_Unpenalise::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Wait_Unpenalise_VarRefs.mm"

	return
	(
#		include "State_Wait_Unpenalise_Transition_1.expr"
	);
}
