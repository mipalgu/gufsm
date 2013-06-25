//
// State_TopCamSwitch.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_TopCamSwitch.h"

#include "State_TopCamSwitch_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

TopCamSwitch::TopCamSwitch(const char *name): CLState(name, *new TopCamSwitch::OnEntry, *new TopCamSwitch::OnExit, *new TopCamSwitch::Internal)
{
	_transitions[0] = new Transition_0();
}

TopCamSwitch::~TopCamSwitch()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void TopCamSwitch::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_TopCamSwitch_VarRefs.mm"
#	include "State_TopCamSwitch_OnEntry.mm"
}

void TopCamSwitch::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_TopCamSwitch_VarRefs.mm"
#	include "State_TopCamSwitch_OnExit.mm"
}

void TopCamSwitch::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_TopCamSwitch_VarRefs.mm"
#	include "State_TopCamSwitch_Internal.mm"
}

bool TopCamSwitch::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_TopCamSwitch_VarRefs.mm"

	return
	(
#		include "State_TopCamSwitch_Transition_0.expr"
	);
}
