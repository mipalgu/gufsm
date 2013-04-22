//
// GameController_FromUDP.mm -- 2013-04-21 23:58:10 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "GameController_FromUDP_Includes.h"
#include "GameController_FromUDP.h"

#include "State_Init.h"
#include "State_Initial.h"
#include "State_Ready.h"
#include "State_Play.h"
#include "State_Penalized.h"
#include "State_Finished.h"
#include "State_Set.h"
#include "State_OurGoal.h"

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
	_states[3] = new FSMGameController_FromUDP::State::Play;
	_states[4] = new FSMGameController_FromUDP::State::Penalized;
	_states[5] = new FSMGameController_FromUDP::State::Finished;
	_states[6] = new FSMGameController_FromUDP::State::Set;
	_states[7] = new FSMGameController_FromUDP::State::OurGoal;

	setCurrentState(_states[0]);            // set initial state
}

GameController_FromUDP::~GameController_FromUDP()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
}
