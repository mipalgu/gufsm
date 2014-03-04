//
//State_LIGHT_NXT_OFF.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "LightNXT_Includes.h"
#include "LightNXT.h"

#include "State_LIGHT_NXT_OFF.h"
#include "State_LIGHT_NXT_OFF_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMLightNXT;
using namespace State;

LIGHT_NXT_OFF::LIGHT_NXT_OFF(const char *name):CLState(name, *new LIGHT_NXT_OFF::OnEntry,*new LIGHT_NXT_OFF::OnExit, *new LIGHT_NXT_OFF::Internal)
{
	_transitions[0] = new Transition_0();
}

LIGHT_NXT_OFF::~LIGHT_NXT_OFF()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void LIGHT_NXT_OFF::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightNXT_VarRefs.mm"
#	include "State_LIGHT_NXT_OFF_VarRefs.mm"
#	include "State_LIGHT_NXT_OFF_OnEntry.mm"
}

void LIGHT_NXT_OFF::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightNXT_VarRefs.mm"
#	include "State_LIGHT_NXT_OFF_VarRefs.mm"
#	include "State_LIGHT_NXT_OFF_OnExit.mm"
}

void LIGHT_NXT_OFF::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightNXT_VarRefs.mm"
#	include "State_LIGHT_NXT_OFF_VarRefs.mm"
#	include "State_LIGHT_NXT_OFF_Internal.mm"
}

bool LIGHT_NXT_OFF::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "LightNXT_VarRefs.mm"
#	include "State_LIGHT_NXT_OFF_VarRefs.mm"

	return
	(
#			include "State_LIGHT_NXT_OFF_Transition_0.expr"
	);
}


