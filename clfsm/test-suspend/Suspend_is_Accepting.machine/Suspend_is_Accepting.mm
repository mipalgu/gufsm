//
// Suspend_is_Accepting.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_is_Accepting_Includes.h"
#include "Suspend_is_Accepting.h"

#include "State_InitialPseudoState.h"
#include "State_Initial.h"
#include "State_About_To_Suspend.h"
#include "State_Done_Suspending.h"
#include "State_Error.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	Suspend_is_Accepting *CLM_Create_Suspend_is_Accepting(int mid, const char *name)
	{
		return new Suspend_is_Accepting(mid, name);
	}
}

Suspend_is_Accepting::Suspend_is_Accepting(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSuspend_is_Accepting::State::InitialPseudoState;
	_states[1] = new FSMSuspend_is_Accepting::State::Initial;
	_states[2] = new FSMSuspend_is_Accepting::State::About_To_Suspend;
	_states[3] = new FSMSuspend_is_Accepting::State::Done_Suspending;
	_states[4] = new FSMSuspend_is_Accepting::State::Error;
	_states[5] = new FSMSuspend_is_Accepting::State::SUSPENDED;

	setSuspendState(_states[5]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

Suspend_is_Accepting::~Suspend_is_Accepting()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
