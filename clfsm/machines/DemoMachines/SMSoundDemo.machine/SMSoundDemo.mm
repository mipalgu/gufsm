//
// SMSoundDemo.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSoundDemo_Includes.h"
#include "SMSoundDemo.h"

#include "State_InitialPseudoState.h"
#include "State_Quiet.h"
#include "State_Whistle.h"
#include "State_Start.h"
#include "State_Stop.h"
#include "State_Initial.h"
#include "State_Retry.h"
#include "State_Extra_Time.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMSoundDemo *CLM_Create_SMSoundDemo(int mid, const char *name)
	{
		return new SMSoundDemo(mid, name);
	}
}

SMSoundDemo::SMSoundDemo(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMSoundDemo::State::InitialPseudoState;
	_states[1] = new FSMSMSoundDemo::State::Quiet;
	_states[2] = new FSMSMSoundDemo::State::Whistle;
	_states[3] = new FSMSMSoundDemo::State::Start;
	_states[4] = new FSMSMSoundDemo::State::Stop;
	_states[5] = new FSMSMSoundDemo::State::Initial;
	_states[6] = new FSMSMSoundDemo::State::Retry;
	_states[7] = new FSMSMSoundDemo::State::Extra_Time;

	setInitialState(_states[0]);            // set initial state
}

SMSoundDemo::~SMSoundDemo()
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
