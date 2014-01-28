//
//State_SUSPEND.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "LineFollower_Includes.h"
#include "LineFollower.h"

#include "State_SUSPEND.h"
#include "State_SUSPEND_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMLineFollower;
using namespace State;

SUSPEND::SUSPEND(const char *name):CLState(name, *new SUSPEND::OnEntry,*new SUSPEND::OnExit, *new SUSPEND::Internal)
{

}

SUSPEND::~SUSPEND()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void SUSPEND::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_SUSPEND_VarRefs.mm"
#	include "State_SUSPEND_OnEntry.mm"
}

void SUSPEND::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_SUSPEND_VarRefs.mm"
#	include "State_SUSPEND_OnExit.mm"
}

void SUSPEND::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_SUSPEND_VarRefs.mm"
#	include "State_SUSPEND_Internal.mm"
}



