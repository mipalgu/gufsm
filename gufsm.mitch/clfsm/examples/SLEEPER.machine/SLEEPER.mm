//
//SLEEPER.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "SLEEPER_Includes.h"
#include "SLEEPER.h"

#include "State_INITIAL.h"
#include "State_SLEEPING.h"

using namespace FSM;
using namespace CLM;
extern "C"
{
	SLEEPER *CLM_Create_SLEEPER(int mid, const char *name)
	{
		return new SLEEPER(mid, name);
	}
}

SLEEPER::SLEEPER(int mid, const char *name): CLMachine(mid, name)
{
	_states[0]  = new FSMSLEEPER::State:: INITIAL;
	_states[1]  = new FSMSLEEPER::State:: SLEEPING;

	setInitialState(_states[0]);            // set initial state
}

SLEEPER::~SLEEPER()
{
	delete _states[0];
	delete _states[1];
}
