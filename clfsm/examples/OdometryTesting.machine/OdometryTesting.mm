//
// OdometryTesting.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "OdometryTesting_Includes.h"
#include "OdometryTesting.h"

#include "State_Init.h"
#include "State_Forward.h"
#include "State_Stop.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	OdometryTesting *CLM_Create_OdometryTesting(int mid, const char *name)
	{
		return new OdometryTesting(mid, name);
	}
}

OdometryTesting::OdometryTesting(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMOdometryTesting::State::Init;
	_states[1] = new FSMOdometryTesting::State::Forward;
	_states[2] = new FSMOdometryTesting::State::Stop;

	setInitialState(_states[0]);            // set initial state
}

OdometryTesting::~OdometryTesting()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
