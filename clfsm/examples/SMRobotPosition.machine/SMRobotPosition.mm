//
// SMRobotPosition.mm -- 2013-05-09 04:51:47 +0000
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
	_states[0] = new FSMSMRobotPosition::State::Init;
	_states[1] = new FSMSMRobotPosition::State::Delay;
	_states[2] = new FSMSMRobotPosition::State::FallingLeft;
	_states[3] = new FSMSMRobotPosition::State::Check;
	_states[4] = new FSMSMRobotPosition::State::FallingRight;
	_states[5] = new FSMSMRobotPosition::State::FallingBack;
	_states[6] = new FSMSMRobotPosition::State::Forward;
	_states[7] = new FSMSMRobotPosition::State::Done;
	_states[8] = new FSMSMRobotPosition::State::StandingUp;

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
