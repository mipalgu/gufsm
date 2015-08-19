//
//State_StatesActions.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "CLReflectDemo_Includes.h"
#include "CLReflectDemo.h"

#include "State_StatesActions.h"
#include "State_StatesActions_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCLReflectDemo;
using namespace State;

StatesActions::StatesActions(const char *name):CLState(name, *new StatesActions::OnEntry,*new StatesActions::OnExit, *new StatesActions::Internal)
{
	_transitions[0] = new Transition_0();
}

StatesActions::~StatesActions()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void StatesActions::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_StatesActions_VarRefs.mm"
#	include "State_StatesActions_OnEntry.mm"
}

void StatesActions::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_StatesActions_VarRefs.mm"
#	include "State_StatesActions_OnExit.mm"
}

void StatesActions::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_StatesActions_VarRefs.mm"
#	include "State_StatesActions_Internal.mm"
}

bool StatesActions::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_StatesActions_VarRefs.mm"

	return
	(
#			include "State_StatesActions_Transition_0.expr"
	);
}


