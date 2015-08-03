//
// State_Error.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_Resume_Restart_Includes.h"
#include "Suspend_Resume_Restart.h"
#include "State_Error.h"

#include "State_Error_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSuspend_Resume_Restart;
using namespace State;

Error::Error(const char *name): CLState(name, *new Error::OnEntry, *new Error::OnExit, *new Error::Internal)
{
}

Error::~Error()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Error::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "State_Error_OnEntry.mm"
}

void Error::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "State_Error_OnExit.mm"
}

void Error::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "State_Error_Internal.mm"
}
