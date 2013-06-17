//
// Color_Learner_Kick.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Kick_Includes.h"
#include "Color_Learner_Kick.h"

#include "State_Init.h"
#include "State_FollowBall.h"
#include "State_SeekBall.h"
#include "State_Kick.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	Color_Learner_Kick *CLM_Create_Color_Learner_Kick(int mid, const char *name)
	{
		return new Color_Learner_Kick(mid, name);
	}
}

Color_Learner_Kick::Color_Learner_Kick(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMColor_Learner_Kick::State::Init;
	_states[1] = new FSMColor_Learner_Kick::State::FollowBall;
	_states[2] = new FSMColor_Learner_Kick::State::SeekBall;
	_states[3] = new FSMColor_Learner_Kick::State::Kick;
	_states[4] = new FSMColor_Learner_Kick::State::SUSPENDED;

	setSuspendState(_states[4]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

Color_Learner_Kick::~Color_Learner_Kick()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
