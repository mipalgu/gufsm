//
// SMPlayer.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"

#include "State_Initial.h"

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

	setInitialState(_states[0]);            // set initial state
}

SMPlayer::~SMPlayer()
{
	delete _states[0];
}
