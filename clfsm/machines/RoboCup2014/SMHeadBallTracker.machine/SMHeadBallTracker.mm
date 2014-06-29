//
// SMHeadBallTracker.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadBallTracker_Includes.h"
#include "SMHeadBallTracker.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_Loop.h"
#include "State_UpdateHead.h"
#include "State_Reset.h"
#include "State_TopSighting.h"
#include "State_BottomSighting.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMHeadBallTracker *CLM_Create_SMHeadBallTracker(int mid, const char *name)
	{
		return new SMHeadBallTracker(mid, name);
	}
}

SMHeadBallTracker::SMHeadBallTracker(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMHeadBallTracker::State::Init;
	_states[1] = new FSMSMHeadBallTracker::State::SUSPENDED;
	_states[2] = new FSMSMHeadBallTracker::State::Loop;
	_states[3] = new FSMSMHeadBallTracker::State::UpdateHead;
	_states[4] = new FSMSMHeadBallTracker::State::Reset;
	_states[5] = new FSMSMHeadBallTracker::State::TopSighting;
	_states[6] = new FSMSMHeadBallTracker::State::BottomSighting;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMHeadBallTracker::~SMHeadBallTracker()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
}
