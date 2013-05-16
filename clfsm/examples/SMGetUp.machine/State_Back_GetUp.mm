//
// State_Back_GetUp.mm -- 2013-05-14 05:44:30 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGetUp_Includes.h"
#include "SMGetUp.h"
#include "State_Back_GetUp.h"

#include "State_Back_GetUp_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGetUp;
using namespace State;

Back_GetUp::Back_GetUp(const char *name): CLState(name, *new Back_GetUp::OnEntry, *new Back_GetUp::OnExit, *new Back_GetUp::Internal)
{
	_transitions[0] = new Transition_0();
}

Back_GetUp::~Back_GetUp()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Back_GetUp::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Back_GetUp_VarRefs.mm"
#	include "State_Back_GetUp_OnEntry.mm"
}

void Back_GetUp::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Back_GetUp_VarRefs.mm"
#	include "State_Back_GetUp_OnExit.mm"
}

void Back_GetUp::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Back_GetUp_VarRefs.mm"
#	include "State_Back_GetUp_Internal.mm"
}

bool Back_GetUp::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Back_GetUp_VarRefs.mm"

	return
	(
#		include "State_Back_GetUp_Transition_0.expr"
	);
}
