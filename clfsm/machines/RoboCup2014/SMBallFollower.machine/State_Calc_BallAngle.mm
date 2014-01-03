//
// State_Calc_BallAngle.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMBallFollower_Includes.h"
#include "SMBallFollower.h"
#include "State_Calc_BallAngle.h"

#include "State_Calc_BallAngle_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMBallFollower;
using namespace State;

(null)::(null)(const char *name): CLState(name, *new (null)::OnEntry, *new (null)::OnExit, *new (null)::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

(null)::~(null)()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void (null)::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Calc_BallAngle_VarRefs.mm"
#	include "State_Calc_BallAngle_OnEntry.mm"
}

void (null)::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Calc_BallAngle_VarRefs.mm"
#	include "State_Calc_BallAngle_OnExit.mm"
}

void (null)::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Calc_BallAngle_VarRefs.mm"
#	include "State_Calc_BallAngle_Internal.mm"
}

bool (null)::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Calc_BallAngle_VarRefs.mm"

	return
	(
#		include "State_Calc_BallAngle_Transition_0.expr"
	);
}

bool (null)::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Calc_BallAngle_VarRefs.mm"

	return
	(
#		include "State_Calc_BallAngle_Transition_1.expr"
	);
}
