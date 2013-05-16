//
// State_RollToSide.mm -- 2013-05-14 05:44:30 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGetUp_Includes.h"
#include "SMGetUp.h"
#include "State_RollToSide.h"

#include "State_RollToSide_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGetUp;
using namespace State;

RollToSide::RollToSide(const char *name): CLState(name, *new RollToSide::OnEntry, *new RollToSide::OnExit, *new RollToSide::Internal)
{
	_transitions[0] = new Transition_0();
}

RollToSide::~RollToSide()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void RollToSide::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_RollToSide_VarRefs.mm"
#	include "State_RollToSide_OnEntry.mm"
}

void RollToSide::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_RollToSide_VarRefs.mm"
#	include "State_RollToSide_OnExit.mm"
}

void RollToSide::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_RollToSide_VarRefs.mm"
#	include "State_RollToSide_Internal.mm"
}

bool RollToSide::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_RollToSide_VarRefs.mm"

	return
	(
#		include "State_RollToSide_Transition_0.expr"
	);
}
