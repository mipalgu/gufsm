//
// AddMachineTest.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "AddMachineTest_Includes.h"
#include "AddMachineTest.h"

#include "State_InitialPseudoState.h"
#include "State_Initial.h"
#include "State_AddMachine.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	AddMachineTest *CLM_Create_AddMachineTest(int mid, const char *name)
	{
		return new AddMachineTest(mid, name);
	}
}

AddMachineTest::AddMachineTest(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMAddMachineTest::State::InitialPseudoState;
	_states[1] = new FSMAddMachineTest::State::Initial;
	_states[2] = new FSMAddMachineTest::State::AddMachine;

	setInitialState(_states[0]);            // set initial state
}

AddMachineTest::~AddMachineTest()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
