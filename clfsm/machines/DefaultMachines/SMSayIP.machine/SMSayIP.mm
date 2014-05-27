//
// SMSayIP.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSayIP_Includes.h"
#include "SMSayIP.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMSayIP *CLM_Create_SMSayIP(int mid, const char *name)
	{
		return new SMSayIP(mid, name);
	}
}

SMSayIP::SMSayIP(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMSayIP::State::Init;
	_states[1] = new FSMSMSayIP::State::SUSPENDED;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMSayIP::~SMSayIP()
{
	delete _states[0];
	delete _states[1];
}
