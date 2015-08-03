//
// State_Check_Resume.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_Resume_Restart_Includes.h"
#include "Suspend_Resume_Restart.h"
#include "State_Check_Resume.h"

#include "State_Check_Resume_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSuspend_Resume_Restart;
using namespace State;

Check_Resume::Check_Resume(const char *name): CLState(name, *new Check_Resume::OnEntry, *new Check_Resume::OnExit, *new Check_Resume::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Check_Resume::~Check_Resume()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Check_Resume::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Check_Resume_VarRefs.mm"
#	include "State_Check_Resume_OnEntry.mm"
}

void Check_Resume::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Check_Resume_VarRefs.mm"
#	include "State_Check_Resume_OnExit.mm"
}

void Check_Resume::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Check_Resume_VarRefs.mm"
#	include "State_Check_Resume_Internal.mm"
}

bool Check_Resume::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Check_Resume_VarRefs.mm"

	return
	(
#		include "State_Check_Resume_Transition_0.expr"
	);
}

bool Check_Resume::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Check_Resume_VarRefs.mm"

	return
	(
#		include "State_Check_Resume_Transition_1.expr"
	);
}
