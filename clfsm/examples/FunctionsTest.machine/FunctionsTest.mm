//
// FunctionsTest.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "FunctionsTest_Includes.h"
#include "FunctionsTest.h"

#include "State_InitialPseudoState.h"
#include "State_Initial.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	FunctionsTest *CLM_Create_FunctionsTest(int mid, const char *name)
	{
		return new FunctionsTest(mid, name);
	}
}

FunctionsTest::FunctionsTest(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMFunctionsTest::State::InitialPseudoState;
	_states[1] = new FSMFunctionsTest::State::Initial;

	setInitialState(_states[0]);            // set initial state
}

FunctionsTest::~FunctionsTest()
{
	delete _states[0];
	delete _states[1];
}
