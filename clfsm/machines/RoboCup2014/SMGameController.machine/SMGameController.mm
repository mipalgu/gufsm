//
// SMGameController.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"

#include "State_Init.h"
#include "State_Initial.h"
#include "State_Ready.h"
#include "State_Play.h"
#include "State_Penalised.h"
#include "State_Finished.h"
#include "State_Set.h"
#include "State_OurGoal.h"
#include "State_Wait_Unpenalise.h"
#include "State_Wait_Chest_Release.h"
#include "State_ChangeKickoff.h"
#include "State_ChangeTeam.h"
#include "State_GetUpReady.h"
#include "State_GetUpPlay.h"
#include "State_GetUp.h"
#include "State_WalkStance.h"
#include "State_Unpenalise.h"
#include "State_ReadyFromInitial.h"
#include "State_SUSPENDED.h"
#include "State_PenalisedStance.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMGameController *CLM_Create_SMGameController(int mid, const char *name)
	{
		return new SMGameController(mid, name);
	}
}

SMGameController::SMGameController(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMGameController::State::Init;
	_states[1] = new FSMSMGameController::State::Initial;
	_states[2] = new FSMSMGameController::State::Ready;
	_states[3] = new FSMSMGameController::State::Play;
	_states[4] = new FSMSMGameController::State::Penalised;
	_states[5] = new FSMSMGameController::State::Finished;
	_states[6] = new FSMSMGameController::State::Set;
	_states[7] = new FSMSMGameController::State::OurGoal;
	_states[8] = new FSMSMGameController::State::Wait_Unpenalise;
	_states[9] = new FSMSMGameController::State::Wait_Chest_Release;
	_states[10] = new FSMSMGameController::State::ChangeKickoff;
	_states[11] = new FSMSMGameController::State::ChangeTeam;
	_states[12] = new FSMSMGameController::State::GetUpReady;
	_states[13] = new FSMSMGameController::State::GetUpPlay;
	_states[14] = new FSMSMGameController::State::GetUp;
	_states[15] = new FSMSMGameController::State::WalkStance;
	_states[16] = new FSMSMGameController::State::Unpenalise;
	_states[17] = new FSMSMGameController::State::ReadyFromInitial;
	_states[18] = new FSMSMGameController::State::SUSPENDED;
	_states[19] = new FSMSMGameController::State::PenalisedStance;

	setSuspendState(_states[18]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMGameController::~SMGameController()
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
	delete _states[19];
}