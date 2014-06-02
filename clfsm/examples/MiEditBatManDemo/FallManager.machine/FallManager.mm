//
// FallManager.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "FallManager_Includes.h"
#include "FallManager.h"

#include "State_INITAIL.h"
#include "State_GET_UP_FINISHED.h"
#include "State_CheckStance.h"
#include "State_Wait_Unwobble.h"
#include "State_RunGetUp.h"
#include "State_SUSPENDED.h"
#include "State_FINISH_FALLING.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	FallManager *CLM_Create_FallManager(int mid, const char *name)
	{
		return new FallManager(mid, name);
	}
}

FallManager::FallManager(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMFallManager::State::INITAIL;
	_states[1] = new FSMFallManager::State::GET_UP_FINISHED;
	_states[2] = new FSMFallManager::State::CheckStance;
	_states[3] = new FSMFallManager::State::Wait_Unwobble;
	_states[4] = new FSMFallManager::State::RunGetUp;
	_states[5] = new FSMFallManager::State::SUSPENDED;
	_states[6] = new FSMFallManager::State::FINISH_FALLING;

	setSuspendState(_states[5]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

FallManager::~FallManager()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
}
