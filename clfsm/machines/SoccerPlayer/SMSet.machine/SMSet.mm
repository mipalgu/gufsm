//
// SMSet.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSet_Includes.h"
#include "SMSet.h"

#include "State_Init.h"
#include "State_FollowBall.h"
#include "State_SeekBall.h"
#include "State_SUSPENDED.h"
#include "State_Walk_Halt.h"
#include "State_Checker.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMSet *CLM_Create_SMSet(int mid, const char *name)
	{
		return new SMSet(mid, name);
	}
}

SMSet::SMSet(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMSet::State::Init;
	_states[1] = new FSMSMSet::State::FollowBall;
	_states[2] = new FSMSMSet::State::SeekBall;
	_states[3] = new FSMSMSet::State::SUSPENDED;
	_states[4] = new FSMSMSet::State::Walk_Halt;
	_states[5] = new FSMSMSet::State::Checker;

	setSuspendState(_states[3]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMSet::~SMSet()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
