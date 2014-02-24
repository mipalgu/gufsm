//
//State_BUTTON_RELEASED.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "buttonNXT_Includes.h"
#include "buttonNXT.h"

#include "State_BUTTON_RELEASED.h"
#include "State_BUTTON_RELEASED_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMbuttonNXT;
using namespace State;

BUTTON_RELEASED::BUTTON_RELEASED(const char *name):CLState(name, *new BUTTON_RELEASED::OnEntry,*new BUTTON_RELEASED::OnExit, *new BUTTON_RELEASED::Internal)
{
	_transitions[0] = new Transition_0();
}

BUTTON_RELEASED::~BUTTON_RELEASED()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void BUTTON_RELEASED::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "buttonNXT_VarRefs.mm"
#	include "State_BUTTON_RELEASED_VarRefs.mm"
#	include "State_BUTTON_RELEASED_OnEntry.mm"
}

void BUTTON_RELEASED::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "buttonNXT_VarRefs.mm"
#	include "State_BUTTON_RELEASED_VarRefs.mm"
#	include "State_BUTTON_RELEASED_OnExit.mm"
}

void BUTTON_RELEASED::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "buttonNXT_VarRefs.mm"
#	include "State_BUTTON_RELEASED_VarRefs.mm"
#	include "State_BUTTON_RELEASED_Internal.mm"
}

bool BUTTON_RELEASED::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "buttonNXT_VarRefs.mm"
#	include "State_BUTTON_RELEASED_VarRefs.mm"

	return
	(
#			include "State_BUTTON_RELEASED_Transition_0.expr"
	);
}


