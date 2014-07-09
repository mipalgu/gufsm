//
// State_KickGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_KickGoal.h"

#include "State_KickGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

KickGoal::KickGoal(const char *name): CLState(name, *new KickGoal::OnEntry, *new KickGoal::OnExit, *new KickGoal::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

KickGoal::~KickGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void KickGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_KickGoal_VarRefs.mm"
#	include "State_KickGoal_OnEntry.mm"
}

void KickGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_KickGoal_VarRefs.mm"
#	include "State_KickGoal_OnExit.mm"
}

void KickGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_KickGoal_VarRefs.mm"
#	include "State_KickGoal_Internal.mm"
}

bool KickGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_KickGoal_VarRefs.mm"

	return
	(
#		include "State_KickGoal_Transition_0.expr"
	);
}

bool KickGoal::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_KickGoal_VarRefs.mm"

	return
	(
#		include "State_KickGoal_Transition_1.expr"
	);
}
