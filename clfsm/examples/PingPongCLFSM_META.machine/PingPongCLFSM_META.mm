//
// PingPongCLFSM.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "PingPongCLFSM_META_Includes.h"
#include "PingPongCLFSM_META.h"

#include "State_Ping.h"
#include "State_Pong.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	PingPongCLFSM_META *CLM_Create_PingPongCLFSM_META(int mid, const char *name)
	{
		return new PingPongCLFSM_META(mid, name);
	}
}

PingPongCLFSM_META::PingPongCLFSM_META(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMPingPongCLFSM_META::State::Ping;
	_states[1] = new FSMPingPongCLFSM_META::State::Pong;

	setInitialState(_states[0]);            // set initial state
}

PingPongCLFSM_META::~PingPongCLFSM_META()
{
	delete _states[0];
	delete _states[1];
}
