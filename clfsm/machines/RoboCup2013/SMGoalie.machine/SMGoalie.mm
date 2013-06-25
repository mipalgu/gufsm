//
// SMGoalie.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalie_Includes.h"
#include "SMGoalie.h"

#include "State_Initial.h"
#include "State_StartTracking.h"
#include "State_FindBall.h"
#include "State_Start.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMGoalie *CLM_Create_SMGoalie(int mid, const char *name)
	{
		return new SMGoalie(mid, name);
	}
}

SMGoalie::SMGoalie(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMGoalie::State::Initial;
	_states[1] = new FSMSMGoalie::State::StartTracking;
	_states[2] = new FSMSMGoalie::State::FindBall;
	_states[3] = new FSMSMGoalie::State::Start;
	_states[4] = new FSMSMGoalie::State::SUSPENDED;

	setSuspendState(_states[4]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMGoalie::~SMGoalie()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
