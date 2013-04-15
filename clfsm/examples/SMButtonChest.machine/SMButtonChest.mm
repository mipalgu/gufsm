//
// SMButtonChest.mm -- 2013-04-15 05:40:11 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMButtonChest_Includes.h"
#include "SMButtonChest.h"

#include "State_Init.h"
#include "State_Button_On.h"
#include "State_Button_Off.h"
#include "State_Wait_Release.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMButtonChest *CLM_Create_SMButtonChest(int mid, const char *name)
	{
		return new SMButtonChest(mid, name);
	}
}

SMButtonChest::SMButtonChest(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMButtonChest::State::Init;
	_states[1] = new FSMSMButtonChest::State::Button_On;
	_states[2] = new FSMSMButtonChest::State::Button_Off;
	_states[3] = new FSMSMButtonChest::State::Wait_Release;

	setCurrentState(_states[0]);            // set initial state
}

SMButtonChest::~SMButtonChest()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
}
