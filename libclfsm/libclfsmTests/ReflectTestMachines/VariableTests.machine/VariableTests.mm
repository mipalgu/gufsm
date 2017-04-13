//
//VariableTests.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "VariableTests_Includes.h"
#include "VariableTests.h"

#include "State_INITIAL.h"

using namespace FSM;
using namespace CLM;
extern "C"
{
	VariableTests *CLM_Create_VariableTests(int mid, const char *name)
	{
		return new VariableTests(mid, name);
	}
}

VariableTests::VariableTests(int mid, const char *name): CLMachine(mid, name)
{
	_states[0]  = new FSMVariableTests::State:: INITIAL;

	setInitialState(_states[0]);            // set initial state
}

VariableTests::~VariableTests()
{
	delete _states[0];
}
