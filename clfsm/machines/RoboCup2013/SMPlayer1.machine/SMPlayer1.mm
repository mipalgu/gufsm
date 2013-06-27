//
// SMPlayer1.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer1_Includes.h"
#include "SMPlayer1.h"

#include "State_Initial.h"
#include "State_StartTracking.h"
#include "State_FindBall.h"
#include "State_Start.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMPlayer1 *CLM_Create_SMPlayer1(int mid, const char *name)
	{
		return new SMPlayer1(mid, name);
	}
}

SMPlayer1::SMPlayer1(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMPlayer1::State::Initial;
	_states[1] = new FSMSMPlayer1::State::StartTracking;
	_states[2] = new FSMSMPlayer1::State::FindBall;
	_states[3] = new FSMSMPlayer1::State::Start;
	_states[4] = new FSMSMPlayer1::State::SUSPENDED;

	setSuspendState(_states[4]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMPlayer1::~SMPlayer1()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
