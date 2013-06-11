//
// SMKicker3.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker3_Includes.h"
#include "SMKicker3.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_KickLeft.h"
#include "State_KickRight.h"
#include "State_WalkConnect.h"
#include "State_FInishKick.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMKicker3 *CLM_Create_SMKicker3(int mid, const char *name)
	{
		return new SMKicker3(mid, name);
	}
}

SMKicker3::SMKicker3(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMKicker3::State::Init;
	_states[1] = new FSMSMKicker3::State::SUSPENDED;
	_states[2] = new FSMSMKicker3::State::KickLeft;
	_states[3] = new FSMSMKicker3::State::KickRight;
	_states[4] = new FSMSMKicker3::State::WalkConnect;
	_states[5] = new FSMSMKicker3::State::FInishKick;

	setInitialState(_states[0]);            // set initial state
}

SMKicker3::~SMKicker3()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
