//
// SMReady.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReady_Includes.h"
#include "SMReady.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_Turn_Head_To_Goal.h"
#include "State_Start_GoalTrackerMachine.h"
#include "State_Walk_2m.h"
#include "State_Stop.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMReady *CLM_Create_SMReady(int mid, const char *name)
	{
		return new SMReady(mid, name);
	}
}

SMReady::SMReady(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMReady::State::Init;
	_states[1] = new FSMSMReady::State::SUSPENDED;
	_states[2] = new FSMSMReady::State::Turn_Head_To_Goal;
	_states[3] = new FSMSMReady::State::Start_GoalTrackerMachine;
	_states[4] = new FSMSMReady::State::Walk_2m;
	_states[5] = new FSMSMReady::State::Stop;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMReady::~SMReady()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
