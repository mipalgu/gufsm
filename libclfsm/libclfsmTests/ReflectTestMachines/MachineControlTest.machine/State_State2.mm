//
//State_State2.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "MachineControlTest_Includes.h"
#include "MachineControlTest.h"

#include "State_State2.h"
#include "State_State2_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMMachineControlTest;
using namespace State;

State2::State2(const char *name):CLState(name, *new State2::OnEntry,*new State2::OnExit, *new State2::Internal)
{

}

State2::~State2()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void State2::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MachineControlTest_VarRefs.mm"
#	include "State_State2_VarRefs.mm"
#	include "State_State2_OnEntry.mm"
}

void State2::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MachineControlTest_VarRefs.mm"
#	include "State_State2_VarRefs.mm"
#	include "State_State2_OnExit.mm"
}

void State2::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MachineControlTest_VarRefs.mm"
#	include "State_State2_VarRefs.mm"
#	include "State_State2_Internal.mm"
}



