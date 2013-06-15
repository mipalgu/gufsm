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

Walk_Disconnect::Walk_Disconnect(const char *name): CLState(name, *new Walk_Disconnect::OnEntry, *new Walk_Disconnect::OnExit, *new Walk_Disconnect::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Walk_Disconnect::~Walk_Disconnect()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Walk_Disconnect::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Walk_Disconnect_VarRefs.mm"
#	include "State_Walk_Disconnect_OnEntry.mm"
}

void Walk_Disconnect::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Walk_Disconnect_VarRefs.mm"
#	include "State_Walk_Disconnect_OnExit.mm"
}

void Walk_Disconnect::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Walk_Disconnect_VarRefs.mm"
#	include "State_Walk_Disconnect_Internal.mm"
}

bool Walk_Disconnect::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Walk_Disconnect_VarRefs.mm"

	return
	(
#		include "State_Walk_Disconnect_Transition_0.expr"
	);
}

bool Walk_Disconnect::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Walk_Disconnect_VarRefs.mm"

	return
	(
#		include "State_Walk_Disconnect_Transition_1.expr"
	);
}
