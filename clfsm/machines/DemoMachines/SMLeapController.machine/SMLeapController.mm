//
// SMLeapController.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMLeapController_Includes.h"
#include "SMLeapController.h"

#include "State_Init.h"
#include "State_GetUp.h"
#include "State_SUSPENDED.h"
#include "State_LeapWalk.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMLeapController *CLM_Create_SMLeapController(int mid, const char *name)
	{
		return new SMLeapController(mid, name);
	}
}

SMLeapController::SMLeapController(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMLeapController::State::Init;
	_states[1] = new FSMSMLeapController::State::GetUp;
	_states[2] = new FSMSMLeapController::State::SUSPENDED;
	_states[3] = new FSMSMLeapController::State::LeapWalk;

	setSuspendState(_states[2]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMLeapController::~SMLeapController()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
