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
#include "State_Walk_1m.h"
#include "State_StartSpinGoalie.h"
#include "State_StopTurning.h"
#include "State_StartSpinPlayers.h"
#include "State_GoToLine.h"
#include "State_SearchGoal.h"
#include "State_Restart_GoalTrackerMachine.h"
#include "State_SlowSpinLeft.h"
#include "State_Asses.h"
#include "State_Continue.h"
#include "State_HeadAlignedWithGoal.h"
#include "State_SlowSpinRight.h"

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
	_states[6] = new FSMSMReady::State::Walk_1m;
	_states[7] = new FSMSMReady::State::StartSpinGoalie;
	_states[8] = new FSMSMReady::State::StopTurning;
	_states[9] = new FSMSMReady::State::StartSpinPlayers;
	_states[10] = new FSMSMReady::State::GoToLine;
	_states[11] = new FSMSMReady::State::SearchGoal;
	_states[12] = new FSMSMReady::State::Restart_GoalTrackerMachine;
	_states[13] = new FSMSMReady::State::SlowSpinLeft;
	_states[14] = new FSMSMReady::State::Asses;
	_states[15] = new FSMSMReady::State::Continue;
	_states[16] = new FSMSMReady::State::HeadAlignedWithGoal;
	_states[17] = new FSMSMReady::State::SlowSpinRight;

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
	delete _states[6];
	delete _states[7];
	delete _states[8];
	delete _states[9];
	delete _states[10];
	delete _states[11];
	delete _states[12];
	delete _states[13];
	delete _states[14];
	delete _states[15];
	delete _states[16];
	delete _states[17];
}
