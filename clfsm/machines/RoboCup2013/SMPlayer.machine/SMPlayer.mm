//
// SMPlayer.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_FollowBall.h"
#include "State_SeekBall.h"
#include "State_Kick.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMPlayer *CLM_Create_SMPlayer(int mid, const char *name)
	{
		return new SMPlayer(mid, name);
	}
}

SMPlayer::SMPlayer(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMPlayer::State::Init;
	_states[1] = new FSMSMPlayer::State::SUSPENDED;
	_states[2] = new FSMSMPlayer::State::FollowBall;
	_states[3] = new FSMSMPlayer::State::SeekBall;
	_states[4] = new FSMSMPlayer::State::Kick;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMPlayer::~SMPlayer()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}