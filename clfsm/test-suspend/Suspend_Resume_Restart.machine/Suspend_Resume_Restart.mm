//
// Suspend_Resume_Restart.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_Resume_Restart_Includes.h"
#include "Suspend_Resume_Restart.h"

#include "State_InitialPseudoState.h"
#include "State_Initial.h"
#include "State_Do_Nothing.h"
#include "State_Check_Suspend_Resume.h"
#include "State_Check_Suspend_Restart.h"
#include "State_OK.h"
#include "State_Error.h"
#include "State_Exit.h"
#include "State_Check_Resume.h"
#include "State_Check_Restart.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	Suspend_Resume_Restart *CLM_Create_Suspend_Resume_Restart(int mid, const char *name)
	{
		return new Suspend_Resume_Restart(mid, name);
	}
}

Suspend_Resume_Restart::Suspend_Resume_Restart(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSuspend_Resume_Restart::State::InitialPseudoState;
	_states[1] = new FSMSuspend_Resume_Restart::State::Initial;
	_states[2] = new FSMSuspend_Resume_Restart::State::Do_Nothing;
	_states[3] = new FSMSuspend_Resume_Restart::State::Check_Suspend_Resume;
	_states[4] = new FSMSuspend_Resume_Restart::State::Check_Suspend_Restart;
	_states[5] = new FSMSuspend_Resume_Restart::State::OK;
	_states[6] = new FSMSuspend_Resume_Restart::State::Error;
	_states[7] = new FSMSuspend_Resume_Restart::State::Exit;
	_states[8] = new FSMSuspend_Resume_Restart::State::Check_Resume;
	_states[9] = new FSMSuspend_Resume_Restart::State::Check_Restart;
	_states[10] = new FSMSuspend_Resume_Restart::State::SUSPENDED;

	setSuspendState(_states[10]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

Suspend_Resume_Restart::~Suspend_Resume_Restart()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
	delete _states[8];
	delete _states[9];
	delete _states[10];
}
