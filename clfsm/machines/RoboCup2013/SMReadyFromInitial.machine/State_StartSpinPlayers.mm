//
// State_StartSpinPlayers.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromInitial_Includes.h"
#include "SMReadyFromInitial.h"
#include "State_StartSpinPlayers.h"

#include "State_StartSpinPlayers_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromInitial;
using namespace State;

StartSpinPlayers::StartSpinPlayers(const char *name): CLState(name, *new StartSpinPlayers::OnEntry, *new StartSpinPlayers::OnExit, *new StartSpinPlayers::Internal)
{
	_transitions[0] = new Transition_0();
}

StartSpinPlayers::~StartSpinPlayers()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StartSpinPlayers::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_StartSpinPlayers_VarRefs.mm"
#	include "State_StartSpinPlayers_OnEntry.mm"
}

void StartSpinPlayers::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_StartSpinPlayers_VarRefs.mm"
#	include "State_StartSpinPlayers_OnExit.mm"
}

void StartSpinPlayers::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_StartSpinPlayers_VarRefs.mm"
#	include "State_StartSpinPlayers_Internal.mm"
}

bool StartSpinPlayers::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_StartSpinPlayers_VarRefs.mm"

	return
	(
#		include "State_StartSpinPlayers_Transition_0.expr"
	);
}
