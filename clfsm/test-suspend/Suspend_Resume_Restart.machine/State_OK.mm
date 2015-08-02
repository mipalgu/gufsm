//
// State_OK.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_Resume_Restart_Includes.h"
#include "Suspend_Resume_Restart.h"
#include "State_OK.h"

#include "State_OK_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSuspend_Resume_Restart;
using namespace State;

OK::OK(const char *name): CLState(name, *new OK::OnEntry, *new OK::OnExit, *new OK::Internal)
{
}

OK::~OK()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void OK::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_OK_VarRefs.mm"
#	include "State_OK_OnEntry.mm"
}

void OK::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_OK_VarRefs.mm"
#	include "State_OK_OnExit.mm"
}

void OK::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_Resume_Restart_VarRefs.mm"
#	include "State_OK_VarRefs.mm"
#	include "State_OK_Internal.mm"
}
