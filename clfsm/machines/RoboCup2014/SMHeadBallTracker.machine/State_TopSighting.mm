//
// State_TopSighting.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadBallTracker_Includes.h"
#include "SMHeadBallTracker.h"
#include "State_TopSighting.h"

#include "State_TopSighting_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadBallTracker;
using namespace State;

TopSighting::TopSighting(const char *name): CLState(name, *new TopSighting::OnEntry, *new TopSighting::OnExit, *new TopSighting::Internal)
{
	_transitions[0] = new Transition_0();
}

TopSighting::~TopSighting()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void TopSighting::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_TopSighting_VarRefs.mm"
#	include "State_TopSighting_OnEntry.mm"
}

void TopSighting::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_TopSighting_VarRefs.mm"
#	include "State_TopSighting_OnExit.mm"
}

void TopSighting::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_TopSighting_VarRefs.mm"
#	include "State_TopSighting_Internal.mm"
}

bool TopSighting::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadBallTracker_VarRefs.mm"
#	include "State_TopSighting_VarRefs.mm"

	return
	(
#		include "State_TopSighting_Transition_0.expr"
	);
}
