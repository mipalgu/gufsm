//
// State_Accurate_Left.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalFollower_Includes.h"
#include "SMGoalFollower.h"
#include "State_Accurate_Left.h"

#include "State_Accurate_Left_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalFollower;
using namespace State;

Accurate_Left::Accurate_Left(const char *name): CLState(name, *new Accurate_Left::OnEntry, *new Accurate_Left::OnExit, *new Accurate_Left::Internal)
{
	_transitions[0] = new Transition_0();
}

Accurate_Left::~Accurate_Left()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Accurate_Left::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Accurate_Left_VarRefs.mm"
#	include "State_Accurate_Left_OnEntry.mm"
}

void Accurate_Left::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Accurate_Left_VarRefs.mm"
#	include "State_Accurate_Left_OnExit.mm"
}

void Accurate_Left::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Accurate_Left_VarRefs.mm"
#	include "State_Accurate_Left_Internal.mm"
}

bool Accurate_Left::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Accurate_Left_VarRefs.mm"

	return
	(
#		include "State_Accurate_Left_Transition_0.expr"
	);
}
