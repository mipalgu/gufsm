//
// State_Suspend_Self_Accepting.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Schedule_Suspend_Includes.h"
#include "Schedule_Suspend.h"
#include "State_Suspend_Self_Accepting.h"

#include "State_Suspend_Self_Accepting_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSchedule_Suspend;
using namespace State;

Suspend_Self_Accepting::Suspend_Self_Accepting(const char *name): CLState(name, *new Suspend_Self_Accepting::OnEntry, *new Suspend_Self_Accepting::OnExit, *new Suspend_Self_Accepting::Internal)
{
}

Suspend_Self_Accepting::~Suspend_Self_Accepting()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Suspend_Self_Accepting::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_Suspend_VarRefs.mm"
#	include "State_Suspend_Self_Accepting_VarRefs.mm"
#	include "State_Suspend_Self_Accepting_OnEntry.mm"
}

void Suspend_Self_Accepting::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_Suspend_VarRefs.mm"
#	include "State_Suspend_Self_Accepting_VarRefs.mm"
#	include "State_Suspend_Self_Accepting_OnExit.mm"
}

void Suspend_Self_Accepting::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_Suspend_VarRefs.mm"
#	include "State_Suspend_Self_Accepting_VarRefs.mm"
#	include "State_Suspend_Self_Accepting_Internal.mm"
}
