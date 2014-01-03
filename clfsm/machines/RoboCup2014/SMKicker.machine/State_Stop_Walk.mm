//
// State_Stop_Walk.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_Stop_Walk.h"

#include "State_Stop_Walk_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

Stop_Walk::Stop_Walk(const char *name): CLState(name, *new Stop_Walk::OnEntry, *new Stop_Walk::OnExit, *new Stop_Walk::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Stop_Walk::~Stop_Walk()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Stop_Walk::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Stop_Walk_VarRefs.mm"
#	include "State_Stop_Walk_OnEntry.mm"
}

void Stop_Walk::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Stop_Walk_VarRefs.mm"
#	include "State_Stop_Walk_OnExit.mm"
}

void Stop_Walk::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Stop_Walk_VarRefs.mm"
#	include "State_Stop_Walk_Internal.mm"
}

bool Stop_Walk::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Stop_Walk_VarRefs.mm"

	return
	(
#		include "State_Stop_Walk_Transition_0.expr"
	);
}

bool Stop_Walk::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Stop_Walk_VarRefs.mm"

	return
	(
#		include "State_Stop_Walk_Transition_1.expr"
	);
}
