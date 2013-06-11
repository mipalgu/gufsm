//
// SMPlayerGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayerGoal_Includes.h"
#include "SMPlayerGoal.h"

#include "State_Init.h"
#include "State_GoToGoal.h"
#include "State_SeekGoal.h"
#include "State_Suspending.h"
#include "State_check_ifVisible.h"
#include "State_Suspending_Scanner.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMPlayerGoal *CLM_Create_SMPlayerGoal(int mid, const char *name)
	{
		return new SMPlayerGoal(mid, name);
	}
}

SMPlayerGoal::SMPlayerGoal(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMPlayerGoal::State::Init;
	_states[1] = new FSMSMPlayerGoal::State::GoToGoal;
	_states[2] = new FSMSMPlayerGoal::State::SeekGoal;
	_states[3] = new FSMSMPlayerGoal::State::Suspending;
	_states[4] = new FSMSMPlayerGoal::State::check_ifVisible;
	_states[5] = new FSMSMPlayerGoal::State::Suspending_Scanner;

	setInitialState(_states[0]);            // set initial state
}

SMPlayerGoal::~SMPlayerGoal()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
