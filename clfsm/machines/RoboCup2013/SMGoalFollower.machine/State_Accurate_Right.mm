//
// State_Accurate_Right.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalFollower_Includes.h"
#include "SMGoalFollower.h"
#include "State_Accurate_Right.h"

#include "State_Accurate_Right_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalFollower;
using namespace State;

Accurate_Right::Accurate_Right(const char *name): CLState(name, *new Accurate_Right::OnEntry, *new Accurate_Right::OnExit, *new Accurate_Right::Internal)
{
	_transitions[0] = new Transition_0();
}

Accurate_Right::~Accurate_Right()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Accurate_Right::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Accurate_Right_VarRefs.mm"
#	include "State_Accurate_Right_OnEntry.mm"
}

void Accurate_Right::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Accurate_Right_VarRefs.mm"
#	include "State_Accurate_Right_OnExit.mm"
}

void Accurate_Right::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Accurate_Right_VarRefs.mm"
#	include "State_Accurate_Right_Internal.mm"
}

bool Accurate_Right::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Accurate_Right_VarRefs.mm"

	return
	(
#		include "State_Accurate_Right_Transition_0.expr"
	);
}
