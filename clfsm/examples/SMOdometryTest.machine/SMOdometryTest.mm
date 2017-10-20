//
// SMOdometryTest.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SMOdometryTest_Includes.h"
#include "SMOdometryTest.h"

#include "State_Initial.h"
#include "State_Suspend.h"
#include "State_Measure_Displacement.h"
#include "State_State_1.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMOdometryTest *CLM_Create_SMOdometryTest(int mid, const char *name)
	{
		return new SMOdometryTest(mid, name);
	}
}

SMOdometryTest::SMOdometryTest(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMOdometryTest::State::Initial;
	_states[1] = new FSMSMOdometryTest::State::Suspend;
	_states[2] = new FSMSMOdometryTest::State::Measure_Displacement;
	_states[3] = new FSMSMOdometryTest::State::State_1;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMOdometryTest::~SMOdometryTest()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
