//
// SMTeleoperationHeadControl.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationHeadControl_Includes.h"
#include "SMTeleoperationHeadControl.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_HeadStop.h"
#include "State_MoveHead.h"
#include "State_Walking.h"
#include "State_HeadStandBy.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMTeleoperationHeadControl *CLM_Create_SMTeleoperationHeadControl(int mid, const char *name)
	{
		return new SMTeleoperationHeadControl(mid, name);
	}
}

SMTeleoperationHeadControl::SMTeleoperationHeadControl(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMTeleoperationHeadControl::State::Init;
	_states[1] = new FSMSMTeleoperationHeadControl::State::SUSPENDED;
	_states[2] = new FSMSMTeleoperationHeadControl::State::HeadStop;
	_states[3] = new FSMSMTeleoperationHeadControl::State::MoveHead;
	_states[4] = new FSMSMTeleoperationHeadControl::State::Walking;
	_states[5] = new FSMSMTeleoperationHeadControl::State::HeadStandBy;

	setInitialState(_states[0]);            // set initial state
}

SMTeleoperationHeadControl::~SMTeleoperationHeadControl()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
