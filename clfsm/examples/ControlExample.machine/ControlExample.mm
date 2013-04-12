//
// ControlExample.mm -- 2013-04-12 00:42:51 +0000
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
	_states[0] = new State::Initial;
	_states[1] = new State::Print_Name;
	_states[2] = new State::Suspend;
	_states[3] = new State::Resume;
	_states[4] = new State::Suspend_2;
	_states[5] = new State::Restart;
	_states[6] = new State::Restart_Self;
	_states[7] = new State::Wait;

	setCurrentState(_states[0]);            // set initial state
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
