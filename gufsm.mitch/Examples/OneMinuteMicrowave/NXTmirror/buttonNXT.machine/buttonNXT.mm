//
// buttonNXT.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "buttonNXT_Includes.h"
#include "buttonNXT.h"

#include "State_INITIAL.h"
#include "State_POST_BUTTON_PRESSED.h"
#include "State_BUTTON_RELEASED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	buttonNXT *CLM_Create_buttonNXT(int mid, const char *name)
	{
		return new buttonNXT(mid, name);
	}
}

buttonNXT::buttonNXT(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMbuttonNXT::State::INITIAL;
	_states[1] = new FSMbuttonNXT::State::POST_BUTTON_PRESSED;
	_states[2] = new FSMbuttonNXT::State::BUTTON_RELEASED;

	setInitialState(_states[0]);            // set initial state
}

buttonNXT::~buttonNXT()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
