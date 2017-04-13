//
// Schedule_Suspend.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Schedule_Suspend_Includes.h"
#include "Schedule_Suspend.h"

#include "State_InitialPseudoState.h"
#include "State_Initial.h"
#include "State_Delete_Testfile.h"
#include "State_Suspend_All.h"
#include "State_Check_Suspended.h"
#include "State_OK.h"
#include "State_Error.h"
#include "State_Suspend_Self_Accepting.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	Schedule_Suspend *CLM_Create_Schedule_Suspend(int mid, const char *name)
	{
		return new Schedule_Suspend(mid, name);
	}
}

Schedule_Suspend::Schedule_Suspend(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSchedule_Suspend::State::InitialPseudoState;
	_states[1] = new FSMSchedule_Suspend::State::Initial;
	_states[2] = new FSMSchedule_Suspend::State::Delete_Testfile;
	_states[3] = new FSMSchedule_Suspend::State::Suspend_All;
	_states[4] = new FSMSchedule_Suspend::State::Check_Suspended;
	_states[5] = new FSMSchedule_Suspend::State::OK;
	_states[6] = new FSMSchedule_Suspend::State::Error;
	_states[7] = new FSMSchedule_Suspend::State::Suspend_Self_Accepting;

	setInitialState(_states[0]);            // set initial state
}

Schedule_Suspend::~Schedule_Suspend()
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
