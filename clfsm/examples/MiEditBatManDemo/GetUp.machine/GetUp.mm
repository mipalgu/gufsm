//
// GetUp.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "GetUp_Includes.h"
#include "GetUp.h"

#include "State_Init.h"
#include "State_Check.h"
#include "State_Back_GetUp.h"
#include "State_Front_GetUp.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	GetUp *CLM_Create_GetUp(int mid, const char *name)
	{
		return new GetUp(mid, name);
	}
}

GetUp::GetUp(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMGetUp::State::Init;
	_states[1] = new FSMGetUp::State::Check;
	_states[2] = new FSMGetUp::State::Back_GetUp;
	_states[3] = new FSMGetUp::State::Front_GetUp;
	_states[4] = new FSMGetUp::State::SUSPENDED;

	setSuspendState(_states[4]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

GetUp::~GetUp()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
