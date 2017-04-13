//
//State_INITIAL.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "MachineControlTest_Includes.h"
#include "MachineControlTest.h"

#include "State_INITIAL.h"
#include "State_INITIAL_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMMachineControlTest;
using namespace State;

INITIAL::INITIAL(const char *name):CLState(name, *new INITIAL::OnEntry,*new INITIAL::OnExit, *new INITIAL::Internal)
{

}

INITIAL::~INITIAL()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void INITIAL::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MachineControlTest_VarRefs.mm"
#	include "State_INITIAL_VarRefs.mm"
#	include "State_INITIAL_OnEntry.mm"
}

void INITIAL::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MachineControlTest_VarRefs.mm"
#	include "State_INITIAL_VarRefs.mm"
#	include "State_INITIAL_OnExit.mm"
}

void INITIAL::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MachineControlTest_VarRefs.mm"
#	include "State_INITIAL_VarRefs.mm"
#	include "State_INITIAL_Internal.mm"
}



