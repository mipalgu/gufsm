//
// SMBallFollower.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMBallFollower_Includes.h"
#include "SMBallFollower.h"

#include "State_Init.h"
#include "State_Calc_BallAngle.h"
#include "State_Turn.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMBallFollower *CLM_Create_SMBallFollower(int mid, const char *name)
	{
		return new SMBallFollower(mid, name);
	}
}

SMBallFollower::SMBallFollower(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMBallFollower::State::Init;
	_states[1] = new FSMSMBallFollower::State::Calc_BallAngle;
	_states[2] = new FSMSMBallFollower::State::Turn;
	_states[3] = new FSMSMBallFollower::State::SUSPENDED;

	setSuspendState(_states[3]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMBallFollower::~SMBallFollower()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
