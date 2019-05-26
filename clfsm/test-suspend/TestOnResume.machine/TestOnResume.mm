//
// TestOnResume.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "TestOnResume_Includes.h"
#include "TestOnResume.h"

#include "State_InitialPseudoState.h"
#include "State_Initial.h"
#include "State_Done_Suspending.h"
#include "State_Error.h"
#include "State_SUSPENDED.h"
#include "State_Done.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	TestOnResume *CLM_Create_TestOnResume(int mid, const char *name)
	{
		return new TestOnResume(mid, name);
	}
}

TestOnResume::TestOnResume(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMTestOnResume::State::InitialPseudoState;
	_states[1] = new FSMTestOnResume::State::Initial;
	_states[2] = new FSMTestOnResume::State::Done_Suspending;
	_states[3] = new FSMTestOnResume::State::Error;
	_states[4] = new FSMTestOnResume::State::SUSPENDED;
	_states[5] = new FSMTestOnResume::State::Done;

	setSuspendState(_states[4]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

TestOnResume::~TestOnResume()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
