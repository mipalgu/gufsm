//
// MotorNXT.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "MotorNXT_Includes.h"
#include "MotorNXT.h"

#include "State_INITIAL.h"
#include "State_MOTOR_NXT_OFF.h"
#include "State_MOTOR_NXT_ON.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	MotorNXT *CLM_Create_MotorNXT(int mid, const char *name)
	{
		return new MotorNXT(mid, name);
	}
}

MotorNXT::MotorNXT(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMMotorNXT::State::INITIAL;
	_states[1] = new FSMMotorNXT::State::MOTOR_NXT_OFF;
	_states[2] = new FSMMotorNXT::State::MOTOR_NXT_ON;

	setInitialState(_states[0]);            // set initial state
}

MotorNXT::~MotorNXT()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
