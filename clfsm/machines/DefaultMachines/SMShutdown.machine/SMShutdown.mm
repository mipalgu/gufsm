//
// SMShutdown.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMShutdown_Includes.h"
#include "SMShutdown.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_Shutdown.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMShutdown *CLM_Create_SMShutdown(int mid, const char *name)
	{
		return new SMShutdown(mid, name);
	}
}

SMShutdown::SMShutdown(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMShutdown::State::Init;
	_states[1] = new FSMSMShutdown::State::SUSPENDED;
	_states[2] = new FSMSMShutdown::State::Shutdown;

	setInitialState(_states[0]);            // set initial state
}

SMShutdown::~SMShutdown()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
