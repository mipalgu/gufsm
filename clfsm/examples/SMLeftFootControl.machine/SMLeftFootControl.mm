//
// SMLeftFootControl.mm -- 2013-04-10 03:51:02 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMLeftFootControl_Includes.h"
#include "SMLeftFootControl.h"

#include "State_Init.h"
#include "State_Button_On.h"
#include "State_Button_Off.h"
#include "State_Wait_Release.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMLeftFootControl *CLM_Create_SMLeftFootControl(int mid, const char *name)
	{
		return new SMLeftFootControl(mid, name);
	}
}

SMLeftFootControl::SMLeftFootControl(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new State::Init;
	_states[1] = new State::Button_On;
	_states[2] = new State::Button_Off;
	_states[3] = new State::Wait_Release;

	setCurrentState(_states[0]);            // set initial state
}

SMLeftFootControl::~SMLeftFootControl()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
