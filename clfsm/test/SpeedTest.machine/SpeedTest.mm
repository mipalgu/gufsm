//
// SpeedTest.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SpeedTest_Includes.h"
#include "SpeedTest.h"

#include "State_InitialPseudoState.h"
#include "State_Initial.h"
#include "State_State_2.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SpeedTest *CLM_Create_SpeedTest(int mid, const char *name)
	{
		return new SpeedTest(mid, name);
	}
}

SpeedTest::SpeedTest(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSpeedTest::State::InitialPseudoState;
	_states[1] = new FSMSpeedTest::State::Initial;
	_states[2] = new FSMSpeedTest::State::State_2;

	setInitialState(_states[0]);            // set initial state
}

SpeedTest::~SpeedTest()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
