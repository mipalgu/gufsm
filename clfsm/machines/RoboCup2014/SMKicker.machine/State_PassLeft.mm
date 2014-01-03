//
// State_PassLeft.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_PassLeft.h"

#include "State_PassLeft_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

PassLeft::PassLeft(const char *name): CLState(name, *new PassLeft::OnEntry, *new PassLeft::OnExit, *new PassLeft::Internal)
{
	_transitions[0] = new Transition_0();
}

PassLeft::~PassLeft()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void PassLeft::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_PassLeft_VarRefs.mm"
#	include "State_PassLeft_OnEntry.mm"
}

void PassLeft::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_PassLeft_VarRefs.mm"
#	include "State_PassLeft_OnExit.mm"
}

void PassLeft::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_PassLeft_VarRefs.mm"
#	include "State_PassLeft_Internal.mm"
}

bool PassLeft::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_PassLeft_VarRefs.mm"

	return
	(
#		include "State_PassLeft_Transition_0.expr"
	);
}
