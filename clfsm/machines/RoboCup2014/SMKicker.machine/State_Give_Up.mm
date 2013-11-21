//
// State_Give_Up.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_Give_Up.h"

#include "State_Give_Up_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

Give_Up::Give_Up(const char *name): CLState(name, *new Give_Up::OnEntry, *new Give_Up::OnExit, *new Give_Up::Internal)
{
	_transitions[0] = new Transition_0();
}

Give_Up::~Give_Up()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Give_Up::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Give_Up_VarRefs.mm"
#	include "State_Give_Up_OnEntry.mm"
}

void Give_Up::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Give_Up_VarRefs.mm"
#	include "State_Give_Up_OnExit.mm"
}

void Give_Up::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Give_Up_VarRefs.mm"
#	include "State_Give_Up_Internal.mm"
}

bool Give_Up::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Give_Up_VarRefs.mm"

	return
	(
#		include "State_Give_Up_Transition_0.expr"
	);
}
