//
// SMHeadGoalTracker.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadGoalTracker_Includes.h"
#include "SMHeadGoalTracker.h"

#include "State_Init.h"
#include "State_Loop.h"
#include "State_Update_Head.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMHeadGoalTracker *CLM_Create_SMHeadGoalTracker(int mid, const char *name)
	{
		return new SMHeadGoalTracker(mid, name);
	}
}

SMHeadGoalTracker::SMHeadGoalTracker(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMHeadGoalTracker::State::Init;
	_states[1] = new FSMSMHeadGoalTracker::State::Loop;
	_states[2] = new FSMSMHeadGoalTracker::State::Update_Head;
	_states[3] = new FSMSMHeadGoalTracker::State::SUSPENDED;

	setSuspendState(_states[3]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMHeadGoalTracker::~SMHeadGoalTracker()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
