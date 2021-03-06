//
// State_Front_GetUp.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "GetUp_Includes.h"
#include "GetUp.h"
#include "State_Front_GetUp.h"

#include "State_Front_GetUp_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMGetUp;
using namespace State;

Front_GetUp::Front_GetUp(const char *name): CLState(name, *new Front_GetUp::OnEntry, *new Front_GetUp::OnExit, *new Front_GetUp::Internal)
{
	_transitions[0] = new Transition_0();
}

Front_GetUp::~Front_GetUp()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Front_GetUp::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GetUp_VarRefs.mm"
#	include "State_Front_GetUp_VarRefs.mm"
#	include "State_Front_GetUp_OnEntry.mm"
}

void Front_GetUp::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GetUp_VarRefs.mm"
#	include "State_Front_GetUp_VarRefs.mm"
#	include "State_Front_GetUp_OnExit.mm"
}

void Front_GetUp::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GetUp_VarRefs.mm"
#	include "State_Front_GetUp_VarRefs.mm"
#	include "State_Front_GetUp_Internal.mm"
}

bool Front_GetUp::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "GetUp_VarRefs.mm"
#	include "State_Front_GetUp_VarRefs.mm"

	return
	(
#		include "State_Front_GetUp_Transition_0.expr"
	);
}
