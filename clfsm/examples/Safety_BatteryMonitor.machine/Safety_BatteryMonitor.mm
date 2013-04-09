//
// Safety_BatteryMonitor.mm -- 2013-04-09 01:20:15 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Safety_BatteryMonitor_Includes.h"
#include "Safety_BatteryMonitor.h"

#include "State_Init.h"
#include "State_Get_Data.h"
#include "State_Wait_State.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	Safety_BatteryMonitor *CLM_Create_Safety_BatteryMonitor(int mid, const char *name)
	{
		return new Safety_BatteryMonitor(mid, name);
	}
}

Safety_BatteryMonitor::Safety_BatteryMonitor(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new State::Init;
	_states[1] = new State::Get_Data;
	_states[2] = new State::Wait_State;

	setCurrentState(_states[0]);            // set initial state
}

Safety_BatteryMonitor::~Safety_BatteryMonitor()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
