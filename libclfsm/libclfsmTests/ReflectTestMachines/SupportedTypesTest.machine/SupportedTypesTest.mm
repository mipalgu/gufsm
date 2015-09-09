//
//SupportedTypesTest.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "SupportedTypesTest_Includes.h"
#include "SupportedTypesTest.h"

#include "State_INITIAL.h"

using namespace FSM;
using namespace CLM;
extern "C"
{
	SupportedTypesTest *CLM_Create_SupportedTypesTest(int mid, const char *name)
	{
		return new SupportedTypesTest(mid, name);
	}
}

SupportedTypesTest::SupportedTypesTest(int mid, const char *name): CLMachine(mid, name)
{
	_states[0]  = new FSMSupportedTypesTest::State:: INITIAL;

	setInitialState(_states[0]);            // set initial state
}

SupportedTypesTest::~SupportedTypesTest()
{
	delete _states[0];
}
