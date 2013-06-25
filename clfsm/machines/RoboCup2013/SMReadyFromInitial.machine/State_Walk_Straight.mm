//
// State_Walk_Straight.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromInitial_Includes.h"
#include "SMReadyFromInitial.h"
#include "State_Walk_Straight.h"

#include "State_Walk_Straight_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromInitial;
using namespace State;

Walk_Straight::Walk_Straight(const char *name): CLState(name, *new Walk_Straight::OnEntry, *new Walk_Straight::OnExit, *new Walk_Straight::Internal)
{
	_transitions[0] = new Transition_0();
}

Walk_Straight::~Walk_Straight()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Walk_Straight::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Walk_Straight_VarRefs.mm"
#	include "State_Walk_Straight_OnEntry.mm"
}

void Walk_Straight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Walk_Straight_VarRefs.mm"
#	include "State_Walk_Straight_OnExit.mm"
}

void Walk_Straight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Walk_Straight_VarRefs.mm"
#	include "State_Walk_Straight_Internal.mm"
}

bool Walk_Straight::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Walk_Straight_VarRefs.mm"

	return
	(
#		include "State_Walk_Straight_Transition_0.expr"
	);
}
