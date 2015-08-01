//
// State_Check_Suspended.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_Includes.h"
#include "Suspend.h"
#include "State_Check_Suspended.h"

#include "State_Check_Suspended_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSuspend;
using namespace State;

Check_Suspended::Check_Suspended(const char *name): CLState(name, *new Check_Suspended::OnEntry, *new Check_Suspended::OnExit, *new Check_Suspended::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Check_Suspended::~Check_Suspended()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Check_Suspended::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Check_Suspended_VarRefs.mm"
#	include "State_Check_Suspended_OnEntry.mm"
}

void Check_Suspended::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Check_Suspended_VarRefs.mm"
#	include "State_Check_Suspended_OnExit.mm"
}

void Check_Suspended::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Check_Suspended_VarRefs.mm"
#	include "State_Check_Suspended_Internal.mm"
}

bool Check_Suspended::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Check_Suspended_VarRefs.mm"

	return
	(
#		include "State_Check_Suspended_Transition_0.expr"
	);
}

bool Check_Suspended::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Check_Suspended_VarRefs.mm"

	return
	(
#		include "State_Check_Suspended_Transition_1.expr"
	);
}
