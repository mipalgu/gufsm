//
// BatNaoMoves.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BatNaoMoves_Includes.h"
#include "BatNaoMoves.h"

#include "State_INITIAL.h"
#include "State_START_SONAR.h"
#include "State_WALK_ABOUT.h"
#include "State_GAME_OVER.h"
#include "State_END.h"
#include "State_TURN_LEFT.h"
#include "State_TURN_RIGHT.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	BatNaoMoves *CLM_Create_BatNaoMoves(int mid, const char *name)
	{
		return new BatNaoMoves(mid, name);
	}
}

BatNaoMoves::BatNaoMoves(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMBatNaoMoves::State::INITIAL;
	_states[1] = new FSMBatNaoMoves::State::START_SONAR;
	_states[2] = new FSMBatNaoMoves::State::WALK_ABOUT;
	_states[3] = new FSMBatNaoMoves::State::GAME_OVER;
	_states[4] = new FSMBatNaoMoves::State::END;
	_states[5] = new FSMBatNaoMoves::State::TURN_LEFT;
	_states[6] = new FSMBatNaoMoves::State::TURN_RIGHT;
	_states[7] = new FSMBatNaoMoves::State::SUSPENDED;

	setSuspendState(_states[7]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

BatNaoMoves::~BatNaoMoves()
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
