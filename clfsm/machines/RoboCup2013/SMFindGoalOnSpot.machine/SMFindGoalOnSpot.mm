//
// SMFindGoalOnSpot.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMFindGoalOnSpot_Includes.h"
#include "SMFindGoalOnSpot.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_GoToLine.h"
#include "State_StartSearchGoal.h"
#include "State_Restart_GoalTrackerMachine.h"
#include "State_SlowSpinToYaw.h"
#include "State_Asses.h"
#include "State_Continue.h"
#include "State_HeadAlignedWithGoal.h"
#include "State_StopSearchGoal.h"
#include "State_StopHeaadScanLittleSping.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMFindGoalOnSpot *CLM_Create_SMFindGoalOnSpot(int mid, const char *name)
	{
		return new SMFindGoalOnSpot(mid, name);
	}
}

SMFindGoalOnSpot::SMFindGoalOnSpot(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMFindGoalOnSpot::State::Init;
	_states[1] = new FSMSMFindGoalOnSpot::State::SUSPENDED;
	_states[2] = new FSMSMFindGoalOnSpot::State::GoToLine;
	_states[3] = new FSMSMFindGoalOnSpot::State::StartSearchGoal;
	_states[4] = new FSMSMFindGoalOnSpot::State::Restart_GoalTrackerMachine;
	_states[5] = new FSMSMFindGoalOnSpot::State::SlowSpinToYaw;
	_states[6] = new FSMSMFindGoalOnSpot::State::Asses;
	_states[7] = new FSMSMFindGoalOnSpot::State::Continue;
	_states[8] = new FSMSMFindGoalOnSpot::State::HeadAlignedWithGoal;
	_states[9] = new FSMSMFindGoalOnSpot::State::StopSearchGoal;
	_states[10] = new FSMSMFindGoalOnSpot::State::StopHeaadScanLittleSping;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMFindGoalOnSpot::~SMFindGoalOnSpot()
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
}
