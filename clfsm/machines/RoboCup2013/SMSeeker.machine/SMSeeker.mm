//
// SMSeeker.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSeeker_Includes.h"
#include "SMSeeker.h"

#include "State_Init.h"
#include "State_HeadSeek.h"
#include "State_SUSPENDED.h"
#include "State_Walk_Halt.h"
#include "State_WalkSeek.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMSeeker *CLM_Create_SMSeeker(int mid, const char *name)
	{
		return new SMSeeker(mid, name);
	}
}

SMSeeker::SMSeeker(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMSeeker::State::Init;
	_states[1] = new FSMSMSeeker::State::HeadSeek;
	_states[2] = new FSMSMSeeker::State::SUSPENDED;
	_states[3] = new FSMSMSeeker::State::Walk_Halt;
	_states[4] = new FSMSMSeeker::State::WalkSeek;

	setSuspendState(_states[2]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMSeeker::~SMSeeker()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}