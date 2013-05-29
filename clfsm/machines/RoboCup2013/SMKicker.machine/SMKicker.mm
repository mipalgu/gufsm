//
// SMKicker.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"

#include "State_Disable_DCM.h"
#include "State_StartKickMotion.h"
#include "State_SUSPENDED.h"
#include "State_KickFinished.h"

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
	_states[0] = new FSMSMKicker::State::Disable_DCM;
	_states[1] = new FSMSMKicker::State::StartKickMotion;
	_states[2] = new FSMSMKicker::State::SUSPENDED;
	_states[3] = new FSMSMKicker::State::KickFinished;

	setSuspendState(_states[2]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMKicker::~SMKicker()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
