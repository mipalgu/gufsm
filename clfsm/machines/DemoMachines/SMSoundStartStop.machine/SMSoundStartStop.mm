//
// SMSoundStartStop.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSoundStartStop_Includes.h"
#include "SMSoundStartStop.h"

#include "State_InitialPseudoState.h"
#include "State_Quiet.h"
#include "State_Start.h"
#include "State_Stop.h"
#include "State_Initial.h"
#include "State_Retry.h"
#include "State_Extra_Time.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMSoundStartStop *CLM_Create_SMSoundStartStop(int mid, const char *name)
	{
		return new SMSoundStartStop(mid, name);
	}
}

SMSoundStartStop::SMSoundStartStop(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMSoundStartStop::State::InitialPseudoState;
	_states[1] = new FSMSMSoundStartStop::State::Quiet;
	_states[2] = new FSMSMSoundStartStop::State::Start;
	_states[3] = new FSMSMSoundStartStop::State::Stop;
	_states[4] = new FSMSMSoundStartStop::State::Initial;
	_states[5] = new FSMSMSoundStartStop::State::Retry;
	_states[6] = new FSMSMSoundStartStop::State::Extra_Time;

	setInitialState(_states[0]);            // set initial state
}

SMSoundStartStop::~SMSoundStartStop()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
}
