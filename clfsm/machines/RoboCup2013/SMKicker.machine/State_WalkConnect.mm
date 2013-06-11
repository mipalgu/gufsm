//
// State_WalkConnect.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_WalkConnect.h"

#include "State_WalkConnect_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

WalkConnect::WalkConnect(const char *name): CLState(name, *new WalkConnect::OnEntry, *new WalkConnect::OnExit, *new WalkConnect::Internal)
{
	_transitions[0] = new Transition_0();
}

WalkConnect::~WalkConnect()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void WalkConnect::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_WalkConnect_VarRefs.mm"
#	include "State_WalkConnect_OnEntry.mm"
}

void WalkConnect::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_WalkConnect_VarRefs.mm"
#	include "State_WalkConnect_OnExit.mm"
}

void WalkConnect::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_WalkConnect_VarRefs.mm"
#	include "State_WalkConnect_Internal.mm"
}

bool WalkConnect::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_WalkConnect_VarRefs.mm"

	return
	(
#		include "State_WalkConnect_Transition_0.expr"
	);
}
