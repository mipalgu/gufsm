//
// SMGetUp.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGetUp_Includes.h"
#include "SMGetUp.h"

#include "State_Init.h"
#include "State_Check.h"
#include "State_Back_GetUp.h"
#include "State_Front_GetUp.h"
#include "State_RollToSide.h"
#include "State_Default.h"
#include "State_SUSPENDED.h"
#include "State_Stiffness.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMGetUp *CLM_Create_SMGetUp(int mid, const char *name)
	{
		return new SMGetUp(mid, name);
	}
}

SMGetUp::SMGetUp(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMGetUp::State::Init;
	_states[1] = new FSMSMGetUp::State::Check;
	_states[2] = new FSMSMGetUp::State::Back_GetUp;
	_states[3] = new FSMSMGetUp::State::Front_GetUp;
	_states[4] = new FSMSMGetUp::State::RollToSide;
	_states[5] = new FSMSMGetUp::State::Default;
	_states[6] = new FSMSMGetUp::State::SUSPENDED;
	_states[7] = new FSMSMGetUp::State::Stiffness;

	setSuspendState(_states[6]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMGetUp::~SMGetUp()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
}
