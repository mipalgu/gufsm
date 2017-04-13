//
// State_Do_Nothing.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_Resume_Restart_Includes.h"
#include "Suspend_Resume_Restart.h"
#include "State_Do_Nothing.h"

#include "State_Do_Nothing_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSuspend_Resume_Restart;
using namespace State;

Do_Nothing::Do_Nothing(const char *name): CLState(name, *new Do_Nothing::OnEntry, *new Do_Nothing::OnExit, *new Do_Nothing::Internal)
{
	_transitions[0] = new Transition_0();
}

Do_Nothing::~Do_Nothing()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Do_Nothing::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Do_Nothing_VarRefs.mm"
#	include "State_Do_Nothing_OnEntry.mm"
}

void Do_Nothing::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Do_Nothing_VarRefs.mm"
#	include "State_Do_Nothing_OnExit.mm"
}

void Do_Nothing::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Do_Nothing_VarRefs.mm"
#	include "State_Do_Nothing_Internal.mm"
}

bool Do_Nothing::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Do_Nothing_VarRefs.mm"

	return
	(
#		include "State_Do_Nothing_Transition_0.expr"
	);
}
