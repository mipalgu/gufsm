//
// SMFallManager.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMFallManager_Includes.h"
#include "SMFallManager.h"

#include "State_StopSensing.h"
#include "State_RunGetUp.h"
#include "State_ResumeSensing.h"
#include "State_SUSPENDED.h"
#include "State_CheckStance.h"
#include "State_WalkEngineStance.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMFallManager *CLM_Create_SMFallManager(int mid, const char *name)
	{
		return new SMFallManager(mid, name);
	}
}

SMFallManager::SMFallManager(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMFallManager::State::StopSensing;
	_states[1] = new FSMSMFallManager::State::RunGetUp;
	_states[2] = new FSMSMFallManager::State::ResumeSensing;
	_states[3] = new FSMSMFallManager::State::SUSPENDED;
	_states[4] = new FSMSMFallManager::State::CheckStance;
	_states[5] = new FSMSMFallManager::State::WalkEngineStance;

	setSuspendState(_states[3]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMFallManager::~SMFallManager()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
