//
//State_Variables.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "CLReflectDemo_Includes.h"
#include "CLReflectDemo.h"

#include "State_Variables.h"
#include "State_Variables_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCLReflectDemo;
using namespace State;

Variables::Variables(const char *name):CLState(name, *new Variables::OnEntry,*new Variables::OnExit, *new Variables::Internal)
{
	_transitions[0] = new Transition_0();
}

Variables::~Variables()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Variables::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_Variables_VarRefs.mm"
#	include "State_Variables_OnEntry.mm"
}

void Variables::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_Variables_VarRefs.mm"
#	include "State_Variables_OnExit.mm"
}

void Variables::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_Variables_VarRefs.mm"
#	include "State_Variables_Internal.mm"
}

bool Variables::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_Variables_VarRefs.mm"

	return
	(
#			include "State_Variables_Transition_0.expr"
	);
}


