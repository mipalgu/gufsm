//
// State_Suspend.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SMLineFollower_Includes.h"
#include "SMLineFollower.h"
#include "State_Suspend.h"

#include "State_Suspend_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMLineFollower;
using namespace State;

Suspend::Suspend(const char *name): CLState(name, *new Suspend::OnEntry, *new Suspend::OnExit, *new Suspend::Internal)
{
}

Suspend::~Suspend()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Suspend::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMLineFollower_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "SMLineFollower_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_OnEntry.mm"
}

void Suspend::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMLineFollower_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "SMLineFollower_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_OnExit.mm"
}

void Suspend::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMLineFollower_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "SMLineFollower_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_Internal.mm"
}

