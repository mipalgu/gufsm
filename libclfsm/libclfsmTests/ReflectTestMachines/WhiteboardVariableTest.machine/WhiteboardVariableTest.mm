//
//WhiteboardVariableTest.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "WhiteboardVariableTest_Includes.h"
#include "WhiteboardVariableTest.h"

#include "State_INITIAL.h"

using namespace FSM;
using namespace CLM;
extern "C"
{
	WhiteboardVariableTest *CLM_Create_WhiteboardVariableTest(int mid, const char *name)
	{
		return new WhiteboardVariableTest(mid, name);
	}
}

WhiteboardVariableTest::WhiteboardVariableTest(int mid, const char *name): CLMachine(mid, name)
{
	_states[0]  = new FSMWhiteboardVariableTest::State:: INITIAL;

	setInitialState(_states[0]);            // set initial state
}

WhiteboardVariableTest::~WhiteboardVariableTest()
{
	delete _states[0];
}
