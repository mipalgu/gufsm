//
// SMPlayer.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"

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
	SMPlayer *CLM_Create_SMPlayer(int mid, const char *name)
	{
		return new SMPlayer(mid, name);
	}
}

SMPlayer::SMPlayer(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMPlayer::State::Init;
	_states[1] = new FSMSMPlayer::State::SUSPENDED;
	_states[2] = new FSMSMPlayer::State::GoToLine;
	_states[3] = new FSMSMPlayer::State::StartSearchGoal;
	_states[4] = new FSMSMPlayer::State::Restart_GoalTrackerMachine;
	_states[5] = new FSMSMPlayer::State::SlowSpinToYaw;
	_states[6] = new FSMSMPlayer::State::Asses;
	_states[7] = new FSMSMPlayer::State::Continue;
	_states[8] = new FSMSMPlayer::State::HeadAlignedWithGoal;
	_states[9] = new FSMSMPlayer::State::StopSearchGoal;
	_states[10] = new FSMSMPlayer::State::StopHeaadScanLittleSping;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMPlayer::~SMPlayer()
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
