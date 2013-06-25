//
// State_RevertCamera.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_RevertCamera.h"

#include "State_RevertCamera_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

RevertCamera::RevertCamera(const char *name): CLState(name, *new RevertCamera::OnEntry, *new RevertCamera::OnExit, *new RevertCamera::Internal)
{
	_transitions[0] = new Transition_0();
}

RevertCamera::~RevertCamera()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void RevertCamera::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_RevertCamera_VarRefs.mm"
#	include "State_RevertCamera_OnEntry.mm"
}

void RevertCamera::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_RevertCamera_VarRefs.mm"
#	include "State_RevertCamera_OnExit.mm"
}

void RevertCamera::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_RevertCamera_VarRefs.mm"
#	include "State_RevertCamera_Internal.mm"
}

bool RevertCamera::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_RevertCamera_VarRefs.mm"

	return
	(
#		include "State_RevertCamera_Transition_0.expr"
	);
}
