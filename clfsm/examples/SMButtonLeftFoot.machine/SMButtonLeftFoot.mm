//
// SMButtonLeftFoot.mm -- 2013-04-12 03:32:40 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMButtonLeftFoot_Includes.h"
#include "SMButtonLeftFoot.h"

#include "State_Init.h"
#include "State_Button_On.h"
#include "State_Button_Off.h"
#include "State_Wait_Release.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMButtonLeftFoot *CLM_Create_SMButtonLeftFoot(int mid, const char *name)
	{
		return new SMButtonLeftFoot(mid, name);
	}
}

SMButtonLeftFoot::SMButtonLeftFoot(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new State::Init;
	_states[1] = new State::Button_On;
	_states[2] = new State::Button_Off;
	_states[3] = new State::Wait_Release;

	setCurrentState(_states[0]);            // set initial state
}

SMButtonLeftFoot::~SMButtonLeftFoot()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
