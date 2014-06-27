//
// StopMotionRecorder.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StopMotionRecorder_Includes.h"
#include "StopMotionRecorder.h"

#include "State_Init.h"
#include "State_Button_On.h"
#include "State_Button_Off.h"
#include "State_Long_Press.h"
#include "State_Zero.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	StopMotionRecorder *CLM_Create_StopMotionRecorder(int mid, const char *name)
	{
		return new StopMotionRecorder(mid, name);
	}
}

StopMotionRecorder::StopMotionRecorder(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMStopMotionRecorder::State::Init;
	_states[1] = new FSMStopMotionRecorder::State::Button_On;
	_states[2] = new FSMStopMotionRecorder::State::Button_Off;
	_states[3] = new FSMStopMotionRecorder::State::Long_Press;
	_states[4] = new FSMStopMotionRecorder::State::Zero;

	setInitialState(_states[0]);            // set initial state
}

StopMotionRecorder::~StopMotionRecorder()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
