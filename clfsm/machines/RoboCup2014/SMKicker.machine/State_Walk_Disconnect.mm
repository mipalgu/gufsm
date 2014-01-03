//
// State_Walk_Disconnect.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_Walk_Disconnect.h"

#include "State_Walk_Disconnect_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

(null)::(null)(const char *name): CLState(name, *new (null)::OnEntry, *new (null)::OnExit, *new (null)::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

(null)::~(null)()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void (null)::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Walk_Disconnect_VarRefs.mm"
#	include "State_Walk_Disconnect_OnEntry.mm"
}

void (null)::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Walk_Disconnect_VarRefs.mm"
#	include "State_Walk_Disconnect_OnExit.mm"
}

void (null)::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Walk_Disconnect_VarRefs.mm"
#	include "State_Walk_Disconnect_Internal.mm"
}

bool (null)::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Walk_Disconnect_VarRefs.mm"

	return
	(
#		include "State_Walk_Disconnect_Transition_0.expr"
	);
}

bool (null)::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Walk_Disconnect_VarRefs.mm"

	return
	(
#		include "State_Walk_Disconnect_Transition_1.expr"
	);
}
