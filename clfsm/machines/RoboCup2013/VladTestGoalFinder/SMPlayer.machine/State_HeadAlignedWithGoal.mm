//
// State_HeadAlignedWithGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"
#include "State_HeadAlignedWithGoal.h"

#include "State_HeadAlignedWithGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayer;
using namespace State;

HeadAlignedWithGoal::HeadAlignedWithGoal(const char *name): CLState(name, *new HeadAlignedWithGoal::OnEntry, *new HeadAlignedWithGoal::OnExit, *new HeadAlignedWithGoal::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

HeadAlignedWithGoal::~HeadAlignedWithGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void HeadAlignedWithGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_OnEntry.mm"
}

void HeadAlignedWithGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_OnExit.mm"
}

void HeadAlignedWithGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_Internal.mm"
}

bool HeadAlignedWithGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_VarRefs.mm"

	return
	(
#		include "State_HeadAlignedWithGoal_Transition_0.expr"
	);
}

bool HeadAlignedWithGoal::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_VarRefs.mm"

	return
	(
#		include "State_HeadAlignedWithGoal_Transition_1.expr"
	);
}
