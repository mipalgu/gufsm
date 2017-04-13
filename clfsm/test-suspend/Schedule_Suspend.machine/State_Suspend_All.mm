//
// State_Suspend_All.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Schedule_Suspend_Includes.h"
#include "Schedule_Suspend.h"
#include "State_Suspend_All.h"

#include "State_Suspend_All_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSchedule_Suspend;
using namespace State;

Suspend_All::Suspend_All(const char *name): CLState(name, *new Suspend_All::OnEntry, *new Suspend_All::OnExit, *new Suspend_All::Internal)
{
	_transitions[0] = new Transition_0();
}

Suspend_All::~Suspend_All()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Suspend_All::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_Suspend_VarRefs.mm"
#	include "State_Suspend_All_VarRefs.mm"
#	include "State_Suspend_All_OnEntry.mm"
}

void Suspend_All::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_Suspend_VarRefs.mm"
#	include "State_Suspend_All_VarRefs.mm"
#	include "State_Suspend_All_OnExit.mm"
}

void Suspend_All::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_Suspend_VarRefs.mm"
#	include "State_Suspend_All_VarRefs.mm"
#	include "State_Suspend_All_Internal.mm"
}

bool Suspend_All::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_Suspend_VarRefs.mm"
#	include "State_Suspend_All_VarRefs.mm"

	return
	(
#		include "State_Suspend_All_Transition_0.expr"
	);
}
