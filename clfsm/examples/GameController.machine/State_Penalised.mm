//
// State_Penalised.mm -- 2013-05-13 03:32:49 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "GameController_Includes.h"
#include "GameController.h"
#include "State_Penalised.h"

#include "State_Penalised_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMGameController;
using namespace State;

Penalised::Penalised(const char *name): CLState(name, *new Penalised::OnEntry, *new Penalised::OnExit, *new Penalised::Internal)
{
	_transitions[0] = new Transition_0();
}

Penalised::~Penalised()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Penalised::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Penalised_VarRefs.mm"
#	include "State_Penalised_OnEntry.mm"
}

void Penalised::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Penalised_VarRefs.mm"
#	include "State_Penalised_OnExit.mm"
}

void Penalised::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Penalised_VarRefs.mm"
#	include "State_Penalised_Internal.mm"
}

bool Penalised::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Penalised_VarRefs.mm"

	return
	(
#		include "State_Penalised_Transition_0.expr"
	);
}
