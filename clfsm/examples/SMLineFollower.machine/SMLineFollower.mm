//
// SMLineFollower.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SMLineFollower_Includes.h"
#include "SMLineFollower.h"

#include "State_Initial.h"
#include "State_Suspend.h"
#include "State_FollowLine.h"
#include "State_Finito.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMLineFollower *CLM_Create_SMLineFollower(int mid, const char *name)
	{
		return new SMLineFollower(mid, name);
	}
}

SMLineFollower::SMLineFollower(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMLineFollower::State::Initial;
	_states[1] = new FSMSMLineFollower::State::Suspend;
	_states[2] = new FSMSMLineFollower::State::FollowLine;
	_states[3] = new FSMSMLineFollower::State::Finito;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMLineFollower::~SMLineFollower()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
