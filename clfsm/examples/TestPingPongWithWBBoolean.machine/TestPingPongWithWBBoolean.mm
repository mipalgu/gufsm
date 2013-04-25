//
// TestPingPongWithWBBoolean.mm -- 2013-04-15 04:27:05 +0000
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
	_states[0] = new FSMTestPingPongWithWBBoolean::State::Ping;
	_states[1] = new FSMTestPingPongWithWBBoolean::State::Pong;

	setCurrentState(_states[0]);            // set initial state
}

TestPingPongWithWBBoolean::~TestPingPongWithWBBoolean()
{
	delete _states[0];
	delete _states[1];
}
