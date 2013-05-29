//
// State_Disable_DCM.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_Disable_DCM.h"

#include "State_Disable_DCM_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

Disable_DCM::Disable_DCM(const char *name): CLState(name, *new Disable_DCM::OnEntry, *new Disable_DCM::OnExit, *new Disable_DCM::Internal)
{
	_transitions[0] = new Transition_0();
}

Disable_DCM::~Disable_DCM()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Disable_DCM::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Disable_DCM_VarRefs.mm"
#	include "State_Disable_DCM_OnEntry.mm"
}

void Disable_DCM::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Disable_DCM_VarRefs.mm"
#	include "State_Disable_DCM_OnExit.mm"
}

void Disable_DCM::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Disable_DCM_VarRefs.mm"
#	include "State_Disable_DCM_Internal.mm"
}

bool Disable_DCM::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Disable_DCM_VarRefs.mm"

	return
	(
#		include "State_Disable_DCM_Transition_0.expr"
	);
}
