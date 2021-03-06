//
// State_Walk_Forward.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalFollower_Includes.h"
#include "SMGoalFollower.h"
#include "State_Walk_Forward.h"

#include "State_Walk_Forward_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalFollower;
using namespace State;

Walk_Forward::Walk_Forward(const char *name): CLState(name, *new Walk_Forward::OnEntry, *new Walk_Forward::OnExit, *new Walk_Forward::Internal)
{
	_transitions[0] = new Transition_0();
}

Walk_Forward::~Walk_Forward()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Walk_Forward::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Walk_Forward_VarRefs.mm"
#	include "State_Walk_Forward_OnEntry.mm"
}

void Walk_Forward::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Walk_Forward_VarRefs.mm"
#	include "State_Walk_Forward_OnExit.mm"
}

void Walk_Forward::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Walk_Forward_VarRefs.mm"
#	include "State_Walk_Forward_Internal.mm"
}

bool Walk_Forward::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Walk_Forward_VarRefs.mm"

	return
	(
#		include "State_Walk_Forward_Transition_0.expr"
	);
}
