//
// SMTeleoperationController.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationController_Includes.h"
#include "SMTeleoperationController.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_Sitting.h"
#include "State_Stand.h"
#include "State_Standing.h"
#include "State_Sit.h"
#include "State_Walk.h"
#include "State_Disconnect.h"
#include "State_Stop.h"
#include "State_Action.h"
#include "State_Connect.h"
#include "State_Connected.h"
#include "State_StartHeadTracking.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMTeleoperationController *CLM_Create_SMTeleoperationController(int mid, const char *name)
	{
		return new SMTeleoperationController(mid, name);
	}
}

SMTeleoperationController::SMTeleoperationController(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMTeleoperationController::State::Init;
	_states[1] = new FSMSMTeleoperationController::State::SUSPENDED;
	_states[2] = new FSMSMTeleoperationController::State::Sitting;
	_states[3] = new FSMSMTeleoperationController::State::Stand;
	_states[4] = new FSMSMTeleoperationController::State::Standing;
	_states[5] = new FSMSMTeleoperationController::State::Sit;
	_states[6] = new FSMSMTeleoperationController::State::Walk;
	_states[7] = new FSMSMTeleoperationController::State::Disconnect;
	_states[8] = new FSMSMTeleoperationController::State::Stop;
	_states[9] = new FSMSMTeleoperationController::State::Action;
	_states[10] = new FSMSMTeleoperationController::State::Connect;
	_states[11] = new FSMSMTeleoperationController::State::Connected;
	_states[12] = new FSMSMTeleoperationController::State::StartHeadTracking;

	setInitialState(_states[0]);            // set initial state
}

SMTeleoperationController::~SMTeleoperationController()
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
}
