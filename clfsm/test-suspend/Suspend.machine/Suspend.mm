//
// Suspend.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_Includes.h"
#include "Suspend.h"

#include "State_InitialPseudoState.h"
#include "State_Initial.h"
#include "State_Delete_Testfile.h"
#include "State_Suspend_All.h"
#include "State_Check_Suspended.h"
#include "State_OK.h"
#include "State_Error.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	Suspend *CLM_Create_Suspend(int mid, const char *name)
	{
		return new Suspend(mid, name);
	}
}

Suspend::Suspend(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSuspend::State::InitialPseudoState;
	_states[1] = new FSMSuspend::State::Initial;
	_states[2] = new FSMSuspend::State::Delete_Testfile;
	_states[3] = new FSMSuspend::State::Suspend_All;
	_states[4] = new FSMSuspend::State::Check_Suspended;
	_states[5] = new FSMSuspend::State::OK;
	_states[6] = new FSMSuspend::State::Error;

	setInitialState(_states[0]);            // set initial state
}

Suspend::~Suspend()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
}
