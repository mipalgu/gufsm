//
// State_PassRight.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_PassRight.h"

#include "State_PassRight_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

PassRight::PassRight(const char *name): CLState(name, *new PassRight::OnEntry, *new PassRight::OnExit, *new PassRight::Internal)
{
	_transitions[0] = new Transition_0();
}

PassRight::~PassRight()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void PassRight::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_PassRight_VarRefs.mm"
#	include "State_PassRight_OnEntry.mm"
}

void PassRight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_PassRight_VarRefs.mm"
#	include "State_PassRight_OnExit.mm"
}

void PassRight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_PassRight_VarRefs.mm"
#	include "State_PassRight_Internal.mm"
}

bool PassRight::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_PassRight_VarRefs.mm"

	return
	(
#		include "State_PassRight_Transition_0.expr"
	);
}
