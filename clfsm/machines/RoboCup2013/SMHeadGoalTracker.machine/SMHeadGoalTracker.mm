//
// SMHeadGoalTracker.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadGoalTracker_Includes.h"
#include "SMHeadGoalTracker.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_UpdateHead.h"
#include "State_UpdateHead_rigt.h"
#include "State_UpdateHead_left.h"
#include "State_UpdateHead_generic.h"
#include "State_Dummy.h"
#include "State_Nothing.h"

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
	_states[1] = new FSMSMHeadGoalTracker::State::SUSPENDED;
	_states[2] = new FSMSMHeadGoalTracker::State::UpdateHead;
	_states[3] = new FSMSMHeadGoalTracker::State::UpdateHead_rigt;
	_states[4] = new FSMSMHeadGoalTracker::State::UpdateHead_left;
	_states[5] = new FSMSMHeadGoalTracker::State::UpdateHead_generic;
	_states[6] = new FSMSMHeadGoalTracker::State::Dummy;
	_states[7] = new FSMSMHeadGoalTracker::State::Nothing;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMHeadGoalTracker::~SMHeadGoalTracker()
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
