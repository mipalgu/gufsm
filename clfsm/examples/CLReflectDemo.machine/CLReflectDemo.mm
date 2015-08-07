//
//CLReflectDemo.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "CLReflectDemo_Includes.h"
#include "CLReflectDemo.h"

#include "State_INITIAL.h"

using namespace FSM;
using namespace CLM;
extern "C"
{
	CLReflectDemo *CLM_Create_CLReflectDemo(int mid, const char *name)
	{
		return new CLReflectDemo(mid, name);
	}
}

CLReflectDemo::CLReflectDemo(int mid, const char *name): CLMachine(mid, name)
{
	_states[0]  = new FSMCLReflectDemo::State:: INITIAL;

	setInitialState(_states[0]);            // set initial state
}

CLReflectDemo::~CLReflectDemo()
{
	delete _states[0];
}
