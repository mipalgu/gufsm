//
// State_StartTracking.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"
#include "State_StartTracking.h"

#include "State_StartTracking_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayer;
using namespace State;

StartTracking::StartTracking(const char *name): CLState(name, *new StartTracking::OnEntry, *new StartTracking::OnExit, *new StartTracking::Internal)
{
	_transitions[0] = new Transition_0();
}

StartTracking::~StartTracking()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StartTracking::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StartTracking_VarRefs.mm"
#	include "State_StartTracking_OnEntry.mm"
}

void StartTracking::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StartTracking_VarRefs.mm"
#	include "State_StartTracking_OnExit.mm"
}

void StartTracking::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StartTracking_VarRefs.mm"
#	include "State_StartTracking_Internal.mm"
}

bool StartTracking::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StartTracking_VarRefs.mm"

	return
	(
#		include "State_StartTracking_Transition_0.expr"
	);
}
