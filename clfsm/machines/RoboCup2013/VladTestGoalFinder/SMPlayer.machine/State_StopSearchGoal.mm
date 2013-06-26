//
// State_StopSearchGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"
#include "State_StopSearchGoal.h"

#include "State_StopSearchGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayer;
using namespace State;

StopSearchGoal::StopSearchGoal(const char *name): CLState(name, *new StopSearchGoal::OnEntry, *new StopSearchGoal::OnExit, *new StopSearchGoal::Internal)
{
	_transitions[0] = new Transition_0();
}

StopSearchGoal::~StopSearchGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StopSearchGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StopSearchGoal_VarRefs.mm"
#	include "State_StopSearchGoal_OnEntry.mm"
}

void StopSearchGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StopSearchGoal_VarRefs.mm"
#	include "State_StopSearchGoal_OnExit.mm"
}

void StopSearchGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StopSearchGoal_VarRefs.mm"
#	include "State_StopSearchGoal_Internal.mm"
}

bool StopSearchGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StopSearchGoal_VarRefs.mm"

	return
	(
#		include "State_StopSearchGoal_Transition_0.expr"
	);
}
