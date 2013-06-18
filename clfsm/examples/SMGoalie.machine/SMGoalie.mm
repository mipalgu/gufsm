//
// SMGoalie.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalie_Includes.h"
#include "SMGoalie.h"

#include "State_Init.h"
#include "State_FollowBall.h"
#include "State_SeekBall.h"
#include "State_SUSPENDED.h"
#include "State_Check.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMGoalie *CLM_Create_SMGoalie(int mid, const char *name)
	{
		return new SMGoalie(mid, name);
	}
}

SMGoalie::SMGoalie(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMGoalie::State::Init;
	_states[1] = new FSMSMGoalie::State::FollowBall;
	_states[2] = new FSMSMGoalie::State::SeekBall;
	_states[3] = new FSMSMGoalie::State::SUSPENDED;
	_states[4] = new FSMSMGoalie::State::Check;

	setSuspendState(_states[3]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMGoalie::~SMGoalie()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
