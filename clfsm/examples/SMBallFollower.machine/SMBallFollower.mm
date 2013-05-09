//
// SMBallFollower.mm -- 2013-05-09 04:48:07 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMBallFollower_Includes.h"
#include "SMBallFollower.h"

#include "State_Init.h"
#include "State_Walk_Forward.h"
#include "State_Stop.h"
#include "State_Calc_BallAngle.h"
#include "State_Decide_Long.h"
#include "State_Long_Left.h"
#include "State_Long_Right.h"
#include "State_Decide_Short.h"
#include "State_Turn_Left.h"
#include "State_Short_Straight.h"
#include "State_Turn_Right.h"
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
	_states[1] = new FSMSMBallFollower::State::Walk_Forward;
	_states[2] = new FSMSMBallFollower::State::Stop;
	_states[3] = new FSMSMBallFollower::State::Calc_BallAngle;
	_states[4] = new FSMSMBallFollower::State::Decide_Long;
	_states[5] = new FSMSMBallFollower::State::Long_Left;
	_states[6] = new FSMSMBallFollower::State::Long_Right;
	_states[7] = new FSMSMBallFollower::State::Decide_Short;
	_states[8] = new FSMSMBallFollower::State::Turn_Left;
	_states[9] = new FSMSMBallFollower::State::Short_Straight;
	_states[10] = new FSMSMBallFollower::State::Turn_Right;
	_states[11] = new FSMSMBallFollower::State::SUSPENDED;

	setSuspendState(_states[11]);            // set suspend state
	setCurrentState(_states[0]);            // set initial state
}

SMBallFollower::~SMBallFollower()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
	delete _states[8];
	delete _states[9];
	delete _states[10];
	delete _states[11];
}
