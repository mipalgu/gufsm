//
//RobotPosition.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "RobotPosition_Includes.h"
#include "RobotPosition.h"

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
	RobotPosition *CLM_Create_RobotPosition(int mid, const char *name)
	{
		return new RobotPosition(mid, name);
	}
}

RobotPosition::RobotPosition(int mid, const char *name): CLMachine(mid, name)
{
	_states[0]  = new FSMRobotPosition::State:: Init;
	_states[1]  = new FSMRobotPosition::State:: Delay;
	_states[2]  = new FSMRobotPosition::State:: FallingLeft;
	_states[3]  = new FSMRobotPosition::State:: Check;
	_states[4]  = new FSMRobotPosition::State:: FallingRight;
	_states[5]  = new FSMRobotPosition::State:: FallingBack;
	_states[6]  = new FSMRobotPosition::State:: Forward;
	_states[7]  = new FSMRobotPosition::State:: Done;
	_states[8]  = new FSMRobotPosition::State:: StandingUp;

	setInitialState(_states[0]);            // set initial state
}

RobotPosition::~RobotPosition()
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
