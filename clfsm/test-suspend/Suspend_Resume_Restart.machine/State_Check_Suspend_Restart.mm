//
// State_Check_Suspend_Restart.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_Resume_Restart_Includes.h"
#include "Suspend_Resume_Restart.h"
#include "State_Check_Suspend_Restart.h"

#include "State_Check_Suspend_Restart_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSuspend_Resume_Restart;
using namespace State;

Check_Suspend_Restart::Check_Suspend_Restart(const char *name): CLState(name, *new Check_Suspend_Restart::OnEntry, *new Check_Suspend_Restart::OnExit, *new Check_Suspend_Restart::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

Check_Suspend_Restart::~Check_Suspend_Restart()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void Check_Suspend_Restart::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Check_Suspend_Restart_VarRefs.mm"
#	include "State_Check_Suspend_Restart_OnEntry.mm"
}

void Check_Suspend_Restart::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Check_Suspend_Restart_VarRefs.mm"
#	include "State_Check_Suspend_Restart_OnExit.mm"
}

void Check_Suspend_Restart::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Check_Suspend_Restart_VarRefs.mm"
#	include "State_Check_Suspend_Restart_Internal.mm"
}

bool Check_Suspend_Restart::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Check_Suspend_Restart_VarRefs.mm"

	return
	(
#		include "State_Check_Suspend_Restart_Transition_0.expr"
	);
}

bool Check_Suspend_Restart::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Check_Suspend_Restart_VarRefs.mm"

	return
	(
#		include "State_Check_Suspend_Restart_Transition_1.expr"
	);
}

bool Check_Suspend_Restart::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Check_Suspend_Restart_VarRefs.mm"

	return
	(
#		include "State_Check_Suspend_Restart_Transition_2.expr"
	);
}
