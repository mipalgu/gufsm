//
// State_DecideHeading.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_DecideHeading.h"

#include "State_DecideHeading_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

DecideHeading::DecideHeading(const char *name): CLState(name, *new DecideHeading::OnEntry, *new DecideHeading::OnExit, *new DecideHeading::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

DecideHeading::~DecideHeading()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void DecideHeading::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_DecideHeading_VarRefs.mm"
#	include "State_DecideHeading_OnEntry.mm"
}

void DecideHeading::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_DecideHeading_VarRefs.mm"
#	include "State_DecideHeading_OnExit.mm"
}

void DecideHeading::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_DecideHeading_VarRefs.mm"
#	include "State_DecideHeading_Internal.mm"
}

bool DecideHeading::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_DecideHeading_VarRefs.mm"

	return
	(
#		include "State_DecideHeading_Transition_0.expr"
	);
}

bool DecideHeading::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_DecideHeading_VarRefs.mm"

	return
	(
#		include "State_DecideHeading_Transition_1.expr"
	);
}
