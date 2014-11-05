//
//EpuckFollowsLine.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "EpuckFollowsLine_Includes.h"
#include "EpuckFollowsLine.h"

#include "State_TURN_CAMERA_ON.h"
#include "State_TURN_ON_ENCODERS.h"
#include "State_GET_MAX_SPEED_AND_CAMERA_WIDTH.h"
#include "State_FEEDBACK_CONTROL.h"
#include "State_SET_MOTORS_SPEED.h"

using namespace FSM;
using namespace CLM;
extern "C"
{
	EpuckFollowsLine *CLM_Create_EpuckFollowsLine(int mid, const char *name)
	{
		return new EpuckFollowsLine(mid, name);
	}
}

EpuckFollowsLine::EpuckFollowsLine(int mid, const char *name): CLMachine(mid, name)
{
	_states[0]  = new FSMEpuckFollowsLine::State:: TURN_CAMERA_ON;
	_states[1]  = new FSMEpuckFollowsLine::State:: TURN_ON_ENCODERS;
	_states[2]  = new FSMEpuckFollowsLine::State:: GET_MAX_SPEED_AND_CAMERA_WIDTH;
	_states[3]  = new FSMEpuckFollowsLine::State:: FEEDBACK_CONTROL;
	_states[4]  = new FSMEpuckFollowsLine::State:: SET_MOTORS_SPEED;

	setInitialState(_states[0]);            // set initial state
}

EpuckFollowsLine::~EpuckFollowsLine()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
