//
// State_Done_Suspending.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_is_Accepting_Includes.h"
#include "Suspend_is_Accepting.h"
#include "State_Done_Suspending.h"

#include "State_Done_Suspending_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSuspend_is_Accepting;
using namespace State;

Done_Suspending::Done_Suspending(const char *name): CLState(name, *new Done_Suspending::OnEntry, *new Done_Suspending::OnExit, *new Done_Suspending::Internal)
{
}

Done_Suspending::~Done_Suspending()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Done_Suspending::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_is_Accepting_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "State_Done_Suspending_OnEntry.mm"
}

void Done_Suspending::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_is_Accepting_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "State_Done_Suspending_OnExit.mm"
}

void Done_Suspending::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_is_Accepting_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "State_Done_Suspending_Internal.mm"
}
