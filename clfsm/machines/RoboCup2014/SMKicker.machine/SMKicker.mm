//
// SMKicker.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"

#include "State_Dummy_Init.h"
#include "State_KickLeft.h"
#include "State_KickRight.h"
#include "State_WalkConnect.h"
#include "State_SUSPENDED.h"
#include "State_Wait.h"
#include "State_Stop_Walk.h"
#include "State_Walk_Disconnect.h"
#include "State_Give_Up.h"
#include "State_PassRight.h"
#include "State_PassLeft.h"
#include "State_KickGoal.h"
#include "State_AvoidGoal.h"
#include "State_DecideHeading.h"
#include "State_DisconnectWalk.h"
#include "State_CheckGoal.h"
#include "State_TurnToGoal.h"
#include "State_Stop.h"
#include "State_LostBall.h"
#include "State_ExtraDelay.h"

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
	_states[1] = new FSMSMKicker::State::KickLeft;
	_states[2] = new FSMSMKicker::State::KickRight;
	_states[3] = new FSMSMKicker::State::WalkConnect;
	_states[4] = new FSMSMKicker::State::SUSPENDED;
	_states[5] = new FSMSMKicker::State::Wait;
	_states[6] = new FSMSMKicker::State::Stop_Walk;
	_states[7] = new FSMSMKicker::State::Walk_Disconnect;
	_states[8] = new FSMSMKicker::State::Give_Up;
	_states[9] = new FSMSMKicker::State::PassRight;
	_states[10] = new FSMSMKicker::State::PassLeft;
	_states[11] = new FSMSMKicker::State::KickGoal;
	_states[12] = new FSMSMKicker::State::AvoidGoal;
	_states[13] = new FSMSMKicker::State::DecideHeading;
	_states[14] = new FSMSMKicker::State::DisconnectWalk;
	_states[15] = new FSMSMKicker::State::CheckGoal;
	_states[16] = new FSMSMKicker::State::TurnToGoal;
	_states[17] = new FSMSMKicker::State::Stop;
	_states[18] = new FSMSMKicker::State::LostBall;
	_states[19] = new FSMSMKicker::State::ExtraDelay;

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
	delete _states[11];
	delete _states[12];
	delete _states[13];
	delete _states[14];
	delete _states[15];
	delete _states[16];
	delete _states[17];
	delete _states[18];
	delete _states[19];
}
