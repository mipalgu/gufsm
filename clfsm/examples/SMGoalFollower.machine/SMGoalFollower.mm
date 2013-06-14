//
// SMGoalFollower.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalFollower_Includes.h"
#include "SMGoalFollower.h"

#include "State_Init.h"
#include "State_Walk_Forward.h"
#include "State_Stop.h"
#include "State_Calc_BallAngle.h"
#include "State_Decide_Long.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMGoalFollower *CLM_Create_SMGoalFollower(int mid, const char *name)
	{
		return new SMGoalFollower(mid, name);
	}
}

SMGoalFollower::SMGoalFollower(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMGoalFollower::State::Init;
	_states[1] = new FSMSMGoalFollower::State::Walk_Forward;
	_states[2] = new FSMSMGoalFollower::State::Stop;
	_states[3] = new FSMSMGoalFollower::State::Calc_BallAngle;
	_states[4] = new FSMSMGoalFollower::State::Decide_Long;
	_states[5] = new FSMSMGoalFollower::State::SUSPENDED;

	setSuspendState(_states[5]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMGoalFollower::~SMGoalFollower()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
