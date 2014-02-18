//
// SMTeleoperationController.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationController_Includes.h"
#include "SMTeleoperationController.h"

#include "State_Init.h"
#include "State_GetUp.h"
#include "State_SUSPENDED.h"
#include "State_Teleoperation.h"

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
	_states[1] = new FSMSMTeleoperationController::State::GetUp;
	_states[2] = new FSMSMTeleoperationController::State::SUSPENDED;
	_states[3] = new FSMSMTeleoperationController::State::Teleoperation;

	setSuspendState(_states[2]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMTeleoperationController::~SMTeleoperationController()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
