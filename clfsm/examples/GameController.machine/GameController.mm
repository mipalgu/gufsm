//
// GameController.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "GameController_Includes.h"
#include "GameController.h"

#include "State_Init.h"
#include "State_Initial.h"
#include "State_Ready.h"
#include "State_Play.h"
#include "State_Penalised.h"
#include "State_Finished.h"
#include "State_Set.h"
#include "State_OurGoal.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	GameController *CLM_Create_GameController(int mid, const char *name)
	{
		return new GameController(mid, name);
	}
}

GameController::GameController(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMGameController::State::Init;
	_states[1] = new FSMGameController::State::Initial;
	_states[2] = new FSMGameController::State::Ready;
	_states[3] = new FSMGameController::State::Play;
	_states[4] = new FSMGameController::State::Penalised;
	_states[5] = new FSMGameController::State::Finished;
	_states[6] = new FSMGameController::State::Set;
	_states[7] = new FSMGameController::State::OurGoal;

	setCurrentState(_states[0]);            // set initial state
}

GameController::~GameController()
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
