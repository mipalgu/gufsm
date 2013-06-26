//
// State_Calc_BallAngle.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalFollower_Includes.h"
#include "SMGoalFollower.h"
#include "State_Calc_BallAngle.h"

#include "State_Calc_BallAngle_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalFollower;
using namespace State;

Calc_BallAngle::Calc_BallAngle(const char *name): CLState(name, *new Calc_BallAngle::OnEntry, *new Calc_BallAngle::OnExit, *new Calc_BallAngle::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Calc_BallAngle::~Calc_BallAngle()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Calc_BallAngle::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Calc_BallAngle_VarRefs.mm"
#	include "State_Calc_BallAngle_OnEntry.mm"
}

void Calc_BallAngle::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Calc_BallAngle_VarRefs.mm"
#	include "State_Calc_BallAngle_OnExit.mm"
}

void Calc_BallAngle::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Calc_BallAngle_VarRefs.mm"
#	include "State_Calc_BallAngle_Internal.mm"
}

bool Calc_BallAngle::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Calc_BallAngle_VarRefs.mm"

	return
	(
#		include "State_Calc_BallAngle_Transition_0.expr"
	);
}

bool Calc_BallAngle::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Calc_BallAngle_VarRefs.mm"

	return
	(
#		include "State_Calc_BallAngle_Transition_1.expr"
	);
}
