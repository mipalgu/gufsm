//
// LEDsPingPong.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "LEDsPingPong_Includes.h"
#include "LEDsPingPong.h"

#include "State_Ping.h"
#include "State_Pong.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	LEDsPingPong *CLM_Create_LEDsPingPong(int mid, const char *name)
	{
		return new LEDsPingPong(mid, name);
	}
}

LEDsPingPong::LEDsPingPong(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMLEDsPingPong::State::Ping;
	_states[1] = new FSMLEDsPingPong::State::Pong;

	setInitialState(_states[0]);            // set initial state
}

LEDsPingPong::~LEDsPingPong()
{
	delete _states[0];
	delete _states[1];
}
