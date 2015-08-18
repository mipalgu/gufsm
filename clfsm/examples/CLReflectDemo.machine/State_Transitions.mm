//
//State_Transitions.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "CLReflectDemo_Includes.h"
#include "CLReflectDemo.h"

#include "State_Transitions.h"
#include "State_Transitions_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCLReflectDemo;
using namespace State;

Transitions::Transitions(const char *name):CLState(name, *new Transitions::OnEntry,*new Transitions::OnExit, *new Transitions::Internal)
{

}

Transitions::~Transitions()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Transitions::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_Transitions_VarRefs.mm"
#	include "State_Transitions_OnEntry.mm"
}

void Transitions::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_Transitions_VarRefs.mm"
#	include "State_Transitions_OnExit.mm"
}

void Transitions::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_Transitions_VarRefs.mm"
#	include "State_Transitions_Internal.mm"
}



