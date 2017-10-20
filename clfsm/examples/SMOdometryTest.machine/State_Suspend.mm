//
// State_Suspend.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SMOdometryTest_Includes.h"
#include "SMOdometryTest.h"
#include "State_Suspend.h"

#include "State_Suspend_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMOdometryTest;
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
#	include "SMOdometryTest_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "SMOdometryTest_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_OnEntry.mm"
}

void Suspend::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMOdometryTest_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "SMOdometryTest_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_OnExit.mm"
}

void Suspend::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMOdometryTest_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "SMOdometryTest_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_Internal.mm"
}

