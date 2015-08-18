//
//CLReflectDemo.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "CLReflectDemo_Includes.h"
#include "CLReflectDemo.h"

#include "State_INITIAL.h"
#include "State_Names.h"
#include "State_StatesActions.h"
#include "State_MethodInvocation.h"
#include "State_Transitions.h"
#include "State_End.h"
#include "State_GetMetaMachine.h"

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
	_states[1]  = new FSMCLReflectDemo::State:: Names;
	_states[2]  = new FSMCLReflectDemo::State:: StatesActions;
	_states[3]  = new FSMCLReflectDemo::State:: MethodInvocation;
	_states[4]  = new FSMCLReflectDemo::State:: Transitions;
	_states[5]  = new FSMCLReflectDemo::State:: End;
	_states[6]  = new FSMCLReflectDemo::State:: GetMetaMachine;

	setInitialState(_states[0]);            // set initial state
}

CLReflectDemo::~CLReflectDemo()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
}
