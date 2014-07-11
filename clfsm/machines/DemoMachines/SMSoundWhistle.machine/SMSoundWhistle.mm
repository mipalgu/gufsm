//
// SMSoundWhistle.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSoundWhistle_Includes.h"
#include "SMSoundWhistle.h"

#include "State_InitialPseudoState.h"
#include "State_Quiet.h"
#include "State_Whistle.h"
#include "State_Initial.h"
#include "State_Retry.h"
#include "State_Extra_Time.h"
#include "State_CheckWhisle.h"
#include "State_ShortWhistle.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMSoundWhistle *CLM_Create_SMSoundWhistle(int mid, const char *name)
	{
		return new SMSoundWhistle(mid, name);
	}
}

SMSoundWhistle::SMSoundWhistle(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMSoundWhistle::State::InitialPseudoState;
	_states[1] = new FSMSMSoundWhistle::State::Quiet;
	_states[2] = new FSMSMSoundWhistle::State::Whistle;
	_states[3] = new FSMSMSoundWhistle::State::Initial;
	_states[4] = new FSMSMSoundWhistle::State::Retry;
	_states[5] = new FSMSMSoundWhistle::State::Extra_Time;
	_states[6] = new FSMSMSoundWhistle::State::CheckWhisle;
	_states[7] = new FSMSMSoundWhistle::State::ShortWhistle;

	setInitialState(_states[0]);            // set initial state
}

SMSoundWhistle::~SMSoundWhistle()
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
