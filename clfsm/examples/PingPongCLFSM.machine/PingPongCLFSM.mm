//
// PingPongCLFSM.mm -- 2013-02-20 08:19:27 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "PingPongCLFSM_Includes.h"
#include "PingPongCLFSM.h"

#include "State_INIT.h"
#include "State_GetBack.h"
#include "State_GetCLoser.h"
#include "State_Stop.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	PingPongCLFSM *CLM_Create_PingPongCLFSM(int mid, const char *name)
	{
		return new PingPongCLFSM(mid, name);
	}
}

PingPongCLFSM::PingPongCLFSM(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new State::INIT;
	_states[1] = new State::GetBack;
	_states[2] = new State::GetCLoser;
	_states[3] = new State::Stop;

	setCurrentState(_states[0]);            // set initial state
}

PingPongCLFSM::~PingPongCLFSM()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
