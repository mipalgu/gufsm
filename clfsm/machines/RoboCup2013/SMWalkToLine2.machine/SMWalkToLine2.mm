//
// SMWalkToLine2.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkToLine2_Includes.h"
#include "SMWalkToLine2.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_FindLine.h"
#include "State_SetHead.h"
#include "State_SetStiffness.h"
#include "State_Walk.h"
#include "State_Stop.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMWalkToLine2 *CLM_Create_SMWalkToLine2(int mid, const char *name)
	{
		return new SMWalkToLine2(mid, name);
	}
}

SMWalkToLine2::SMWalkToLine2(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMWalkToLine2::State::Init;
	_states[1] = new FSMSMWalkToLine2::State::SUSPENDED;
	_states[2] = new FSMSMWalkToLine2::State::FindLine;
	_states[3] = new FSMSMWalkToLine2::State::SetHead;
	_states[4] = new FSMSMWalkToLine2::State::SetStiffness;
	_states[5] = new FSMSMWalkToLine2::State::Walk;
	_states[6] = new FSMSMWalkToLine2::State::Stop;

	setInitialState(_states[0]);            // set initial state
}

SMWalkToLine2::~SMWalkToLine2()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
}
