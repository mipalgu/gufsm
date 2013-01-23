//
// BackForwardsCLFSM.mm -- 2013-01-23 06:03:42 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BackForwardsCLFSM_Includes.h"
#include "BackForwardsCLFSM.h"

#include "State_INIT.h"
#include "State_Pong.h"
#include "State_Ping.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	BackForwardsCLFSM *CLM_Create_BackForwardsCLFSM(int mid, const char *name)
	{
		return new BackForwardsCLFSM(mid, name);
	}
}

BackForwardsCLFSM::BackForwardsCLFSM(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new State::INIT;
	_states[1] = new State::Pong;
	_states[2] = new State::Ping;

	setCurrentState(_states[0]);            // set initial state
}

BackForwardsCLFSM::~BackForwardsCLFSM()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
