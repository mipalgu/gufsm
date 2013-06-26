//
// SMReadyFromInitial.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromInitial_Includes.h"
#include "SMReadyFromInitial.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_Turn_Head_To_Goal.h"
#include "State_Start_GoalTrackerMachine.h"
#include "State_Walk_Straight.h"
#include "State_Decide.h"
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
#include "State_Check_Angle.h"
#include "State_Walk_Angle.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMReadyFromInitial *CLM_Create_SMReadyFromInitial(int mid, const char *name)
	{
		return new SMReadyFromInitial(mid, name);
	}
}

SMReadyFromInitial::SMReadyFromInitial(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMReadyFromInitial::State::Init;
	_states[1] = new FSMSMReadyFromInitial::State::SUSPENDED;
	_states[2] = new FSMSMReadyFromInitial::State::Turn_Head_To_Goal;
	_states[3] = new FSMSMReadyFromInitial::State::Start_GoalTrackerMachine;
	_states[4] = new FSMSMReadyFromInitial::State::Walk_Straight;
	_states[5] = new FSMSMReadyFromInitial::State::Decide;
	_states[6] = new FSMSMReadyFromInitial::State::StartSpinGoalie;
	_states[7] = new FSMSMReadyFromInitial::State::StopTurning;
	_states[8] = new FSMSMReadyFromInitial::State::StartSpinPlayers;
	_states[9] = new FSMSMReadyFromInitial::State::GoToLine;
	_states[10] = new FSMSMReadyFromInitial::State::SearchGoal;
	_states[11] = new FSMSMReadyFromInitial::State::Restart_GoalTrackerMachine;
	_states[12] = new FSMSMReadyFromInitial::State::SlowSpinLeft;
	_states[13] = new FSMSMReadyFromInitial::State::Asses;
	_states[14] = new FSMSMReadyFromInitial::State::Continue;
	_states[15] = new FSMSMReadyFromInitial::State::HeadAlignedWithGoal;
	_states[16] = new FSMSMReadyFromInitial::State::SlowSpinRight;
	_states[17] = new FSMSMReadyFromInitial::State::Check_Angle;
	_states[18] = new FSMSMReadyFromInitial::State::Walk_Angle;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMReadyFromInitial::~SMReadyFromInitial()
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
	delete _states[18];
}
