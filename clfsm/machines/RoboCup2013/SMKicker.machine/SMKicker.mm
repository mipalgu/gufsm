//
// SMKicker.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"

#include "State_Dummy_Init.h"
#include "State_Init.h"
#include "State_KickLeft.h"
#include "State_KickRight.h"
#include "State_WalkConnect.h"
#include "State_FinishKick.h"
#include "State_SUSPENDED.h"
#include "State_Wait.h"
#include "State_Stop_Walk.h"
#include "State_Walk_Disconnect.h"
#include "State_Give_Up.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMKicker *CLM_Create_SMKicker(int mid, const char *name)
	{
		return new SMKicker(mid, name);
	}
}

SMKicker::SMKicker(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMKicker::State::Dummy_Init;
	_states[1] = new FSMSMKicker::State::Init;
	_states[2] = new FSMSMKicker::State::KickLeft;
	_states[3] = new FSMSMKicker::State::KickRight;
	_states[4] = new FSMSMKicker::State::WalkConnect;
	_states[5] = new FSMSMKicker::State::FinishKick;
	_states[6] = new FSMSMKicker::State::SUSPENDED;
	_states[7] = new FSMSMKicker::State::Wait;
	_states[8] = new FSMSMKicker::State::Stop_Walk;
	_states[9] = new FSMSMKicker::State::Walk_Disconnect;
	_states[10] = new FSMSMKicker::State::Give_Up;

	setSuspendState(_states[5]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMKicker::~SMKicker()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
	delete _states[8];
	delete _states[9];
	delete _states[10];
}
