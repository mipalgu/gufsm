//
// SMGetCloseToGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGetCloseToGoal_Includes.h"
#include "SMGetCloseToGoal.h"

#include "State_Init.h"
#include "State_FollowBall.h"
#include "State_SeekBall.h"
#include "State_SUSPENDED.h"
#include "State_Check.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMGetCloseToGoal *CLM_Create_SMGetCloseToGoal(int mid, const char *name)
	{
		return new SMGetCloseToGoal(mid, name);
	}
}

SMGetCloseToGoal::SMGetCloseToGoal(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMGetCloseToGoal::State::Init;
	_states[1] = new FSMSMGetCloseToGoal::State::FollowBall;
	_states[2] = new FSMSMGetCloseToGoal::State::SeekBall;
	_states[3] = new FSMSMGetCloseToGoal::State::SUSPENDED;
	_states[4] = new FSMSMGetCloseToGoal::State::Check;

	setSuspendState(_states[3]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMGetCloseToGoal::~SMGetCloseToGoal()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
