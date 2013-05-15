//
// State_Penalized.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "GameController_FromUDP_Includes.h"
#include "GameController_FromUDP.h"
#include "State_Penalized.h"

#include "State_Penalized_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMGameController_FromUDP;
using namespace State;

Penalized::Penalized(const char *name): CLState(name, *new Penalized::OnEntry, *new Penalized::OnExit, *new Penalized::Internal)
{
	_transitions[0] = new Transition_0();
}

Penalized::~Penalized()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Penalized::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_FromUDP_VarRefs.mm"
#	include "State_Penalized_VarRefs.mm"
#	include "State_Penalized_OnEntry.mm"
}

void Penalized::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_FromUDP_VarRefs.mm"
#	include "State_Penalized_VarRefs.mm"
#	include "State_Penalized_OnExit.mm"
}

void Penalized::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_FromUDP_VarRefs.mm"
#	include "State_Penalized_VarRefs.mm"
#	include "State_Penalized_Internal.mm"
}

bool Penalized::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_FromUDP_VarRefs.mm"
#	include "State_Penalized_VarRefs.mm"

	return
	(
#		include "State_Penalized_Transition_0.expr"
	);
}
