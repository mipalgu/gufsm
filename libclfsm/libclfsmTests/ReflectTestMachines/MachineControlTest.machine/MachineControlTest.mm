//
//MachineControlTest.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "MachineControlTest_Includes.h"
#include "MachineControlTest.h"

#include "State_INITIAL.h"
#include "State_State2.h"
#include "State_SuspendState.h"

using namespace FSM;
using namespace CLM;
extern "C"
{
	MachineControlTest *CLM_Create_MachineControlTest(int mid, const char *name)
	{
		return new MachineControlTest(mid, name);
	}
}

MachineControlTest::MachineControlTest(int mid, const char *name): CLMachine(mid, name)
{
	_states[0]  = new FSMMachineControlTest::State:: INITIAL;
	_states[1]  = new FSMMachineControlTest::State:: State2;
	_states[2]  = new FSMMachineControlTest::State:: SuspendState;

	setSuspendState(_states[2]); // set suspended state
	setInitialState(_states[0]);            // set initial state
}

MachineControlTest::~MachineControlTest()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
