//
//State_MethodInvocation.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "CLReflectDemo_Includes.h"
#include "CLReflectDemo.h"

#include "State_MethodInvocation.h"
#include "State_MethodInvocation_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCLReflectDemo;
using namespace State;

MethodInvocation::MethodInvocation(const char *name):CLState(name, *new MethodInvocation::OnEntry,*new MethodInvocation::OnExit, *new MethodInvocation::Internal)
{

}

MethodInvocation::~MethodInvocation()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void MethodInvocation::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_MethodInvocation_VarRefs.mm"
#	include "State_MethodInvocation_OnEntry.mm"
}

void MethodInvocation::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_MethodInvocation_VarRefs.mm"
#	include "State_MethodInvocation_OnExit.mm"
}

void MethodInvocation::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_MethodInvocation_VarRefs.mm"
#	include "State_MethodInvocation_Internal.mm"
}



