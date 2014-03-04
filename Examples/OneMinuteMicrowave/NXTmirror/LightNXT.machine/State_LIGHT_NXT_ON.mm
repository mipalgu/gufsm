//
//State_LIGHT_NXT_ON.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "LightNXT_Includes.h"
#include "LightNXT.h"

#include "State_LIGHT_NXT_ON.h"
#include "State_LIGHT_NXT_ON_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMLightNXT;
using namespace State;

LIGHT_NXT_ON::LIGHT_NXT_ON(const char *name):CLState(name, *new LIGHT_NXT_ON::OnEntry,*new LIGHT_NXT_ON::OnExit, *new LIGHT_NXT_ON::Internal)
{
	_transitions[0] = new Transition_0();
}

LIGHT_NXT_ON::~LIGHT_NXT_ON()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void LIGHT_NXT_ON::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightNXT_VarRefs.mm"
#	include "State_LIGHT_NXT_ON_VarRefs.mm"
#	include "State_LIGHT_NXT_ON_OnEntry.mm"
}

void LIGHT_NXT_ON::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightNXT_VarRefs.mm"
#	include "State_LIGHT_NXT_ON_VarRefs.mm"
#	include "State_LIGHT_NXT_ON_OnExit.mm"
}

void LIGHT_NXT_ON::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightNXT_VarRefs.mm"
#	include "State_LIGHT_NXT_ON_VarRefs.mm"
#	include "State_LIGHT_NXT_ON_Internal.mm"
}

bool LIGHT_NXT_ON::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "LightNXT_VarRefs.mm"
#	include "State_LIGHT_NXT_ON_VarRefs.mm"

	return
	(
#			include "State_LIGHT_NXT_ON_Transition_0.expr"
	);
}


