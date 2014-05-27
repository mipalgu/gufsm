//
//LineFollower.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "LineFollower_Includes.h"
#include "LineFollower.h"

#include "State_TURN_ON_CAMERA.h"
#include "State_TURN_ON_ENCODERS.h"
#include "State_GET_MAX_SPEED.h"
#include "State_GET_CAMERA_INFO.h"
#include "State_SET_MOTOR_SPEED.h"
#include "State_SUSPEND.h"

using namespace FSM;
using namespace CLM;
extern "C"
{
	LineFollower *CLM_Create_LineFollower(int mid, const char *name)
	{
		return new LineFollower(mid, name);
	}
}

LineFollower::LineFollower(int mid, const char *name): CLMachine(mid, name)
{
	_states[0]  = new FSMLineFollower::State:: TURN_ON_CAMERA;
	_states[1]  = new FSMLineFollower::State:: TURN_ON_ENCODERS;
	_states[2]  = new FSMLineFollower::State:: GET_MAX_SPEED;
	_states[3]  = new FSMLineFollower::State:: GET_CAMERA_INFO;
	_states[4]  = new FSMLineFollower::State:: SET_MOTOR_SPEED;
	_states[5]  = new FSMLineFollower::State:: SUSPEND;

	setInitialState(_states[0]);            // set initial state
}

LineFollower::~LineFollower()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
