//
// SayPingPong.mm -- 2013-03-27 07:18:59 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SayPingPong_Includes.h"
#include "SayPingPong.h"

#include "State_Ping.h"
#include "State_Pong.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SayPingPong *CLM_Create_SayPingPong(int mid, const char *name)
	{
		return new SayPingPong(mid, name);
	}
}

SayPingPong::SayPingPong(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new State::Ping;
	_states[1] = new State::Pong;

	setCurrentState(_states[0]);            // set initial state
}

SayPingPong::~SayPingPong()
{
	delete _states[0];
	delete _states[1];
}
