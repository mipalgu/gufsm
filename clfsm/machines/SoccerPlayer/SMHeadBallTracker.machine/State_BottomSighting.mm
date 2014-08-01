//
// State_BottomSighting.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadBallTracker_Includes.h"
#include "SMHeadBallTracker.h"
#include "State_BottomSighting.h"

#include "State_BottomSighting_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadBallTracker;
using namespace State;

BottomSighting::BottomSighting(const char *name): CLState(name, *new BottomSighting::OnEntry, *new BottomSighting::OnExit, *new BottomSighting::Internal)
{
	_transitions[0] = new Transition_0();
}

BottomSighting::~BottomSighting()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void BottomSighting::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_BottomSighting_VarRefs.mm"
#	include "State_BottomSighting_OnEntry.mm"
}

void BottomSighting::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_BottomSighting_VarRefs.mm"
#	include "State_BottomSighting_OnExit.mm"
}

void BottomSighting::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_BottomSighting_VarRefs.mm"
#	include "State_BottomSighting_Internal.mm"
}

bool BottomSighting::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_BottomSighting_VarRefs.mm"

	return
	(
#		include "State_BottomSighting_Transition_0.expr"
	);
}
