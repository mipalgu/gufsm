//
//State_Names.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "CLReflectDemo_Includes.h"
#include "CLReflectDemo.h"

#include "State_Names.h"
#include "State_Names_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCLReflectDemo;
using namespace State;

Names::Names(const char *name):CLState(name, *new Names::OnEntry,*new Names::OnExit, *new Names::Internal)
{

}

Names::~Names()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Names::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_Names_VarRefs.mm"
#	include "State_Names_OnEntry.mm"
}

void Names::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_Names_VarRefs.mm"
#	include "State_Names_OnExit.mm"
}

void Names::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_Names_VarRefs.mm"
#	include "State_Names_Internal.mm"
}



