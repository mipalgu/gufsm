//
// BatManController.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BatManController_Includes.h"
#include "BatManController.h"

#include "State_Init.h"
#include "State_GetUp.h"
#include "State_SUSPENDED.h"
#include "State_BAT_MAN_BEHAVIOR.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	BatManController *CLM_Create_BatManController(int mid, const char *name)
	{
		return new BatManController(mid, name);
	}
}

BatManController::BatManController(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMBatManController::State::Init;
	_states[1] = new FSMBatManController::State::GetUp;
	_states[2] = new FSMBatManController::State::SUSPENDED;
	_states[3] = new FSMBatManController::State::BAT_MAN_BEHAVIOR;

	setSuspendState(_states[2]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

BatManController::~BatManController()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
