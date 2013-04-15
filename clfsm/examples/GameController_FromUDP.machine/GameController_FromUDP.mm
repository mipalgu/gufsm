//
// GameController_FromUDP.mm -- 2013-04-15 05:10:33 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "GameController_FromUDP_Includes.h"
#include "GameController_FromUDP.h"

#include "State_Init.h"
#include "State_Initial.h"
#include "State_Ready.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	GameController_FromUDP *CLM_Create_GameController_FromUDP(int mid, const char *name)
	{
		return new GameController_FromUDP(mid, name);
	}
}

GameController_FromUDP::GameController_FromUDP(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMGameController_FromUDP::State::Init;
	_states[1] = new FSMGameController_FromUDP::State::Initial;
	_states[2] = new FSMGameController_FromUDP::State::Ready;

	setCurrentState(_states[0]);            // set initial state
}

GameController_FromUDP::~GameController_FromUDP()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
