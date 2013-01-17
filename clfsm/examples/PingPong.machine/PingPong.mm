//
// PingPong.mm -- 2013-01-17 22:28:42 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "PingPong.h"
#include "State_Ping.h"
#include "State_Pong.h"
#include "PingPong_Includes.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	PingPong *CLM_Create_PingPong(int mid, const char *name)
	{
		return new PingPong(mid, name);
	}
}

PingPong::PingPong(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new State::Ping;
	_states[1] = new State::Pong;

	setCurrentState(_states[0]);            // set initial state
}

PingPong::~PingPong()
{
	delete _states[0];
	delete _states[1];
}
