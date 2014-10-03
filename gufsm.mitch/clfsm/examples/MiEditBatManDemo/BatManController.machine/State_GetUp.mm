//
// State_GetUp.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BatManController_Includes.h"
#include "BatManController.h"
#include "State_GetUp.h"

#include "State_GetUp_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBatManController;
using namespace State;

GetUp::GetUp(const char *name): CLState(name, *new GetUp::OnEntry, *new GetUp::OnExit, *new GetUp::Internal)
{
	_transitions[0] = new Transition_0();
}

GetUp::~GetUp()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void GetUp::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatManController_VarRefs.mm"
#	include "State_GetUp_VarRefs.mm"
#	include "State_GetUp_OnEntry.mm"
}

void GetUp::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatManController_VarRefs.mm"
#	include "State_GetUp_VarRefs.mm"
#	include "State_GetUp_OnExit.mm"
}

void GetUp::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatManController_VarRefs.mm"
#	include "State_GetUp_VarRefs.mm"
#	include "State_GetUp_Internal.mm"
}

bool GetUp::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BatManController_VarRefs.mm"
#	include "State_GetUp_VarRefs.mm"

	return
	(
#		include "State_GetUp_Transition_0.expr"
	);
}
