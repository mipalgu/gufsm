//
// SMGoaliePlayer.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoaliePlayer_Includes.h"
#include "SMGoaliePlayer.h"

#include "State_Initial.h"
#include "State_StartTracking.h"
#include "State_FindBall.h"
#include "State_Start.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMGoaliePlayer *CLM_Create_SMGoaliePlayer(int mid, const char *name)
	{
		return new SMGoaliePlayer(mid, name);
	}
}

SMGoaliePlayer::SMGoaliePlayer(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMGoaliePlayer::State::Initial;
	_states[1] = new FSMSMGoaliePlayer::State::StartTracking;
	_states[2] = new FSMSMGoaliePlayer::State::FindBall;
	_states[3] = new FSMSMGoaliePlayer::State::Start;
	_states[4] = new FSMSMGoaliePlayer::State::SUSPENDED;

	setSuspendState(_states[4]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMGoaliePlayer::~SMGoaliePlayer()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
