//
// BatNao.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BatNao_Includes.h"
#include "BatNao.h"

#include "State_INITIAL.h"
#include "State_SONAR_VALUES.h"
#include "State_WALK_ABOUT.h"
#include "State_GAME_OVER.h"
#include "State_END.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	BatNao *CLM_Create_BatNao(int mid, const char *name)
	{
		return new BatNao(mid, name);
	}
}

BatNao::BatNao(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMBatNao::State::INITIAL;
	_states[1] = new FSMBatNao::State::SONAR_VALUES;
	_states[2] = new FSMBatNao::State::WALK_ABOUT;
	_states[3] = new FSMBatNao::State::GAME_OVER;
	_states[4] = new FSMBatNao::State::END;

	setInitialState(_states[0]);            // set initial state
}

BatNao::~BatNao()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
