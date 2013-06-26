//
// State_OurHalfFacingUp.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_OurHalfFacingUp.h"

#include "State_OurHalfFacingUp_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

OurHalfFacingUp::OurHalfFacingUp(const char *name): CLState(name, *new OurHalfFacingUp::OnEntry, *new OurHalfFacingUp::OnExit, *new OurHalfFacingUp::Internal)
{
	_transitions[0] = new Transition_0();
}

OurHalfFacingUp::~OurHalfFacingUp()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void OurHalfFacingUp::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_OurHalfFacingUp_VarRefs.mm"
#	include "State_OurHalfFacingUp_OnEntry.mm"
}

void OurHalfFacingUp::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_OurHalfFacingUp_VarRefs.mm"
#	include "State_OurHalfFacingUp_OnExit.mm"
}

void OurHalfFacingUp::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_OurHalfFacingUp_VarRefs.mm"
#	include "State_OurHalfFacingUp_Internal.mm"
}

bool OurHalfFacingUp::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_OurHalfFacingUp_VarRefs.mm"

	return
	(
#		include "State_OurHalfFacingUp_Transition_0.expr"
	);
}
