//
// State_LeapWalk.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMLeapController_Includes.h"
#include "SMLeapController.h"
#include "State_LeapWalk.h"

#include "State_LeapWalk_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMLeapController;
using namespace State;

LeapWalk::LeapWalk(const char *name): CLState(name, *new LeapWalk::OnEntry, *new LeapWalk::OnExit, *new LeapWalk::Internal)
{
	_transitions[0] = new Transition_0();
}

LeapWalk::~LeapWalk()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void LeapWalk::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMLeapController_VarRefs.mm"
#	include "State_LeapWalk_VarRefs.mm"
#	include "State_LeapWalk_OnEntry.mm"
}

void LeapWalk::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMLeapController_VarRefs.mm"
#	include "State_LeapWalk_VarRefs.mm"
#	include "State_LeapWalk_OnExit.mm"
}

void LeapWalk::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMLeapController_VarRefs.mm"
#	include "State_LeapWalk_VarRefs.mm"
#	include "State_LeapWalk_Internal.mm"
}

bool LeapWalk::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMLeapController_VarRefs.mm"
#	include "State_LeapWalk_VarRefs.mm"

	return
	(
#		include "State_LeapWalk_Transition_0.expr"
	);
}
