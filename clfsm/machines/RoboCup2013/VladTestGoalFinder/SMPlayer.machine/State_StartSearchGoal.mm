//
// State_StartSearchGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"
#include "State_StartSearchGoal.h"

#include "State_StartSearchGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayer;
using namespace State;

StartSearchGoal::StartSearchGoal(const char *name): CLState(name, *new StartSearchGoal::OnEntry, *new StartSearchGoal::OnExit, *new StartSearchGoal::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

StartSearchGoal::~StartSearchGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void StartSearchGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StartSearchGoal_VarRefs.mm"
#	include "State_StartSearchGoal_OnEntry.mm"
}

void StartSearchGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StartSearchGoal_VarRefs.mm"
#	include "State_StartSearchGoal_OnExit.mm"
}

void StartSearchGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StartSearchGoal_VarRefs.mm"
#	include "State_StartSearchGoal_Internal.mm"
}

bool StartSearchGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StartSearchGoal_VarRefs.mm"

	return
	(
#		include "State_StartSearchGoal_Transition_0.expr"
	);
}

bool StartSearchGoal::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StartSearchGoal_VarRefs.mm"

	return
	(
#		include "State_StartSearchGoal_Transition_1.expr"
	);
}
