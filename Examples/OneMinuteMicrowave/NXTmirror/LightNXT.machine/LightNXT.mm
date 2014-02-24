//
//LightNXT.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "LightNXT_Includes.h"
#include "LightNXT.h"

#include "State_INITIAL.h"
#include "State_LIGHT_NXT_OFF.h"
#include "State_LIGHT_NXT_ON.h"

using namespace FSM;
using namespace CLM;
extern "C"
{
	LightNXT *CLM_Create_LightNXT(int mid, const char *name)
	{
		return new LightNXT(mid, name);
	}
}

LightNXT::LightNXT(int mid, const char *name): CLMachine(mid, name)
{
	_states[0]  = new FSMLightNXT::State:: INITIAL;
	_states[1]  = new FSMLightNXT::State:: LIGHT_NXT_OFF;
	_states[2]  = new FSMLightNXT::State:: LIGHT_NXT_ON;

	setInitialState(_states[0]);            // set initial state
}

LightNXT::~LightNXT()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
