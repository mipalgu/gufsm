//
//TestSuspend.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "TestSuspend_Includes.h"
#include "TestSuspend.h"

#include "State_INITIAL.h"
#include "State_OTHER.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;
extern "C"
{
	TestSuspend *CLM_Create_TestSuspend(int mid, const char *name)
	{
		return new TestSuspend(mid, name);
	}
}

TestSuspend::TestSuspend(int mid, const char *name): CLMachine(mid, name)
{
	_states[0]  = new FSMTestSuspend::State:: INITIAL;
	_states[1]  = new FSMTestSuspend::State:: OTHER;
	_states[2]  = new FSMTestSuspend::State:: SUSPENDED;

	setSuspendState(_states[2]); // set suspended state
	setInitialState(_states[0]);            // set initial state
}

TestSuspend::~TestSuspend()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
