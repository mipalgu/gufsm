//
// BellNXT.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BellNXT_Includes.h"
#include "BellNXT.h"

#include "State_INITIAL.h"
#include "State_PLAY_ITH_NOTE.h"
#include "State_INCREMENT.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	BellNXT *CLM_Create_BellNXT(int mid, const char *name)
	{
		return new BellNXT(mid, name);
	}
}

BellNXT::BellNXT(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMBellNXT::State::INITIAL;
	_states[1] = new FSMBellNXT::State::PLAY_ITH_NOTE;
	_states[2] = new FSMBellNXT::State::INCREMENT;

	setInitialState(_states[0]);            // set initial state
}

BellNXT::~BellNXT()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
