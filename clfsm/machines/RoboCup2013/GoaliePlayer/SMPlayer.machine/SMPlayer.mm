//
// SMPlayer.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"

#include "State_Initial.h"
#include "State_StartTracking.h"
#include "State_FindBall.h"
#include "State_Start.h"
#include "State_SUSPENDED.h"

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
	_states[0] = new FSMSMPlayer::State::Initial;
	_states[1] = new FSMSMPlayer::State::StartTracking;
	_states[2] = new FSMSMPlayer::State::FindBall;
	_states[3] = new FSMSMPlayer::State::Start;
	_states[4] = new FSMSMPlayer::State::SUSPENDED;

	setSuspendState(_states[4]);            // set suspend state
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
