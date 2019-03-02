//
// TestOnSuspend.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "TestOnSuspend_Includes.h"
#include "TestOnSuspend.h"

#include "State_InitialPseudoState.h"
#include "State_Initial.h"
#include "State_Done_Suspending.h"
#include "State_Error.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	TestOnSuspend *CLM_Create_TestOnSuspend(int mid, const char *name)
	{
		return new TestOnSuspend(mid, name);
	}
}

TestOnSuspend::TestOnSuspend(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMTestOnSuspend::State::InitialPseudoState;
	_states[1] = new FSMTestOnSuspend::State::Initial;
	_states[2] = new FSMTestOnSuspend::State::Done_Suspending;
	_states[3] = new FSMTestOnSuspend::State::Error;
	_states[4] = new FSMTestOnSuspend::State::SUSPENDED;

	setSuspendState(_states[4]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

TestOnSuspend::~TestOnSuspend()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
