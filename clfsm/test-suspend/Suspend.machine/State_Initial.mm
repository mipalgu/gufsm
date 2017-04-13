//
// State_Initial.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_Includes.h"
#include "Suspend.h"
#include "State_Initial.h"

#include "State_Initial_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSuspend;
using namespace State;

Initial::Initial(const char *name): CLState(name, *new Initial::OnEntry, *new Initial::OnExit, *new Initial::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Initial::~Initial()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Initial::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "State_Initial_OnEntry.mm"
}

void Initial::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "State_Initial_OnExit.mm"
}

void Initial::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "State_Initial_Internal.mm"
}

bool Initial::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"

	return
	(
#		include "State_Initial_Transition_0.expr"
	);
}

bool Initial::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"

	return
	(
#		include "State_Initial_Transition_1.expr"
	);
}
