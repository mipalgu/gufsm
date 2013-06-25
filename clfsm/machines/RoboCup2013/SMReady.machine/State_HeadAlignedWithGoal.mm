//
// State_HeadAlignedWithGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReady_Includes.h"
#include "SMReady.h"
#include "State_HeadAlignedWithGoal.h"

#include "State_HeadAlignedWithGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReady;
using namespace State;

HeadAlignedWithGoal::HeadAlignedWithGoal(const char *name): CLState(name, *new HeadAlignedWithGoal::OnEntry, *new HeadAlignedWithGoal::OnExit, *new HeadAlignedWithGoal::Internal)
{
	_transitions[0] = new Transition_0();
}

HeadAlignedWithGoal::~HeadAlignedWithGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void HeadAlignedWithGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_OnEntry.mm"
}

void HeadAlignedWithGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_OnExit.mm"
}

void HeadAlignedWithGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_Internal.mm"
}

bool HeadAlignedWithGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_HeadAlignedWithGoal_VarRefs.mm"

	return
	(
#		include "State_HeadAlignedWithGoal_Transition_0.expr"
	);
}
