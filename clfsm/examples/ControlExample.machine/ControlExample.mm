//
// ControlExample.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "ControlExample_Includes.h"
#include "ControlExample.h"

#include "State_Initial.h"
#include "State_Print_Name.h"
#include "State_Suspend.h"
#include "State_Resume.h"
#include "State_Suspend_2.h"
#include "State_Restart.h"
#include "State_Restart_Self.h"
#include "State_Wait.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	ControlExample *CLM_Create_ControlExample(int mid, const char *name)
	{
		return new ControlExample(mid, name);
	}
}

ControlExample::ControlExample(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMControlExample::State::Initial;
	_states[1] = new FSMControlExample::State::Print_Name;
	_states[2] = new FSMControlExample::State::Suspend;
	_states[3] = new FSMControlExample::State::Resume;
	_states[4] = new FSMControlExample::State::Suspend_2;
	_states[5] = new FSMControlExample::State::Restart;
	_states[6] = new FSMControlExample::State::Restart_Self;
	_states[7] = new FSMControlExample::State::Wait;

	setInitialState(_states[0]);            // set initial state
}

ControlExample::~ControlExample()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
}
