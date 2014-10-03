//
// doorNXT.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "doorNXT_Includes.h"
#include "doorNXT.h"

#include "State_INITIAL.h"
#include "State_DOOR_OPEN.h"
#include "State_DOOR_CLOSED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	doorNXT *CLM_Create_doorNXT(int mid, const char *name)
	{
		return new doorNXT(mid, name);
	}
}

doorNXT::doorNXT(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMdoorNXT::State::INITIAL;
	_states[1] = new FSMdoorNXT::State::DOOR_OPEN;
	_states[2] = new FSMdoorNXT::State::DOOR_CLOSED;

	setInitialState(_states[0]);            // set initial state
}

doorNXT::~doorNXT()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
