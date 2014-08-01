//
// State_Unpenalise.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_Unpenalise.h"

#include "State_Unpenalise_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

Unpenalise::Unpenalise(const char *name): CLState(name, *new Unpenalise::OnEntry, *new Unpenalise::OnExit, *new Unpenalise::Internal)
{
	_transitions[0] = new Transition_0();
}

Unpenalise::~Unpenalise()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Unpenalise::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Unpenalise_VarRefs.mm"
#	include "State_Unpenalise_OnEntry.mm"
}

void Unpenalise::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Unpenalise_VarRefs.mm"
#	include "State_Unpenalise_OnExit.mm"
}

void Unpenalise::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Unpenalise_VarRefs.mm"
#	include "State_Unpenalise_Internal.mm"
}

bool Unpenalise::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Unpenalise_VarRefs.mm"

	return
	(
#		include "State_Unpenalise_Transition_0.expr"
	);
}
