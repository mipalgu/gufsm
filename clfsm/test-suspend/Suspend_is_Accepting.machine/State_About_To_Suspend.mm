//
// State_About_To_Suspend.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_is_Accepting_Includes.h"
#include "Suspend_is_Accepting.h"
#include "State_About_To_Suspend.h"

#include "State_About_To_Suspend_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSuspend_is_Accepting;
using namespace State;

About_To_Suspend::About_To_Suspend(const char *name): CLState(name, *new About_To_Suspend::OnEntry, *new About_To_Suspend::OnExit, *new About_To_Suspend::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

About_To_Suspend::~About_To_Suspend()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void About_To_Suspend::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_is_Accepting_VarRefs.mm"
#	include "State_About_To_Suspend_VarRefs.mm"
#	include "State_About_To_Suspend_OnEntry.mm"
}

void About_To_Suspend::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_is_Accepting_VarRefs.mm"
#	include "State_About_To_Suspend_VarRefs.mm"
#	include "State_About_To_Suspend_OnExit.mm"
}

void About_To_Suspend::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_is_Accepting_VarRefs.mm"
#	include "State_About_To_Suspend_VarRefs.mm"
#	include "State_About_To_Suspend_Internal.mm"
}

bool About_To_Suspend::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_is_Accepting_VarRefs.mm"
#	include "State_About_To_Suspend_VarRefs.mm"

	return
	(
#		include "State_About_To_Suspend_Transition_0.expr"
	);
}

bool About_To_Suspend::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_is_Accepting_VarRefs.mm"
#	include "State_About_To_Suspend_VarRefs.mm"

	return
	(
#		include "State_About_To_Suspend_Transition_1.expr"
	);
}
