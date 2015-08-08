//
//State_States.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "CLReflectDemo_Includes.h"
#include "CLReflectDemo.h"

#include "State_States.h"
#include "State_States_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCLReflectDemo;
using namespace State;

States::States(const char *name):CLState(name, *new States::OnEntry,*new States::OnExit, *new States::Internal)
{

}

States::~States()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void States::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_States_VarRefs.mm"
#	include "State_States_OnEntry.mm"
}

void States::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_States_VarRefs.mm"
#	include "State_States_OnExit.mm"
}

void States::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_States_VarRefs.mm"
#	include "State_States_Internal.mm"
}



