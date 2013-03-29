//
// TestPingPongWithWBBoolean.mm -- 2013-03-27 07:36:57 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "TestPingPongWithWBBoolean_Includes.h"
#include "TestPingPongWithWBBoolean.h"

#include "State_Ping.h"
#include "State_Pong.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	TestPingPongWithWBBoolean *CLM_Create_TestPingPongWithWBBoolean(int mid, const char *name)
	{
		return new TestPingPongWithWBBoolean(mid, name);
	}
}

TestPingPongWithWBBoolean::TestPingPongWithWBBoolean(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new State::Ping;
	_states[1] = new State::Pong;

	setCurrentState(_states[0]);            // set initial state
}

TestPingPongWithWBBoolean::~TestPingPongWithWBBoolean()
{
	delete _states[0];
	delete _states[1];
}
