//
// State_FinishKick.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_FinishKick.h"

#include "State_FinishKick_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

FinishKick::FinishKick(const char *name): CLState(name, *new FinishKick::OnEntry, *new FinishKick::OnExit, *new FinishKick::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

FinishKick::~FinishKick()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void FinishKick::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_FinishKick_VarRefs.mm"
#	include "State_FinishKick_OnEntry.mm"
}

void FinishKick::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_FinishKick_VarRefs.mm"
#	include "State_FinishKick_OnExit.mm"
}

void FinishKick::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_FinishKick_VarRefs.mm"
#	include "State_FinishKick_Internal.mm"
}

bool FinishKick::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_FinishKick_VarRefs.mm"

	return
	(
#		include "State_FinishKick_Transition_0.expr"
	);
}

bool FinishKick::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_FinishKick_VarRefs.mm"

	return
	(
#		include "State_FinishKick_Transition_1.expr"
	);
}
