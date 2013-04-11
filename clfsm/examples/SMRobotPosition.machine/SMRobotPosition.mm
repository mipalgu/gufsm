//
// SMRobotPosition.mm -- 2013-04-11 06:20:00 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMRobotPosition_Includes.h"
#include "SMRobotPosition.h"

#include "State_Init.h"
#include "State_Delay.h"
#include "State_FallingLeft.h"
#include "State_Check.h"
#include "State_FallingRight.h"
#include "State_FallingBack.h"
#include "State_Forward.h"
#include "State_Done.h"
#include "State_StandingUp.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMRobotPosition *CLM_Create_SMRobotPosition(int mid, const char *name)
	{
		return new SMRobotPosition(mid, name);
	}
}

SMRobotPosition::SMRobotPosition(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new State::Init;
	_states[1] = new State::Delay;
	_states[2] = new State::FallingLeft;
	_states[3] = new State::Check;
	_states[4] = new State::FallingRight;
	_states[5] = new State::FallingBack;
	_states[6] = new State::Forward;
	_states[7] = new State::Done;
	_states[8] = new State::StandingUp;

	setCurrentState(_states[0]);            // set initial state
}

SMRobotPosition::~SMRobotPosition()
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
}
