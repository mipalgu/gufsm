//
// State_Finished.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "GameController_FromUDP_Includes.h"
#include "GameController_FromUDP.h"
#include "State_Finished.h"

#include "State_Finished_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMGameController_FromUDP;
using namespace State;

Finished::Finished(const char *name): CLState(name, *new Finished::OnEntry, *new Finished::OnExit, *new Finished::Internal)
{
	_transitions[0] = new Transition_0();
}

Finished::~Finished()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Finished::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_FromUDP_VarRefs.mm"
#	include "State_Finished_VarRefs.mm"
#	include "State_Finished_OnEntry.mm"
}

void Finished::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_FromUDP_VarRefs.mm"
#	include "State_Finished_VarRefs.mm"
#	include "State_Finished_OnExit.mm"
}

void Finished::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_FromUDP_VarRefs.mm"
#	include "State_Finished_VarRefs.mm"
#	include "State_Finished_Internal.mm"
}

bool Finished::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_FromUDP_VarRefs.mm"
#	include "State_Finished_VarRefs.mm"

	return
	(
#		include "State_Finished_Transition_0.expr"
	);
}
