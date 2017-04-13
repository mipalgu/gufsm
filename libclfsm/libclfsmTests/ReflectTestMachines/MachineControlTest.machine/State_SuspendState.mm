//
//State_SuspendState.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "MachineControlTest_Includes.h"
#include "MachineControlTest.h"

#include "State_SuspendState.h"
#include "State_SuspendState_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMMachineControlTest;
using namespace State;

SuspendState::SuspendState(const char *name):CLState(name, *new SuspendState::OnEntry,*new SuspendState::OnExit, *new SuspendState::Internal)
{

}

SuspendState::~SuspendState()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void SuspendState::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MachineControlTest_VarRefs.mm"
#	include "State_SuspendState_VarRefs.mm"
#	include "State_SuspendState_OnEntry.mm"
}

void SuspendState::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MachineControlTest_VarRefs.mm"
#	include "State_SuspendState_VarRefs.mm"
#	include "State_SuspendState_OnExit.mm"
}

void SuspendState::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MachineControlTest_VarRefs.mm"
#	include "State_SuspendState_VarRefs.mm"
#	include "State_SuspendState_Internal.mm"
}



