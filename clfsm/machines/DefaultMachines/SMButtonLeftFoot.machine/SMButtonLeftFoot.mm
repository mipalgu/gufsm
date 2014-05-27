//
// SMButtonLeftFoot.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMButtonLeftFoot_Includes.h"
#include "SMButtonLeftFoot.h"

#include "State_Init.h"
#include "State_Button_On.h"
#include "State_Button_Off.h"
#include "State_Long_Press.h"
#include "State_Zero.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMButtonLeftFoot *CLM_Create_SMButtonLeftFoot(int mid, const char *name)
	{
		return new SMButtonLeftFoot(mid, name);
	}
}

SMButtonLeftFoot::SMButtonLeftFoot(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMButtonLeftFoot::State::Init;
	_states[1] = new FSMSMButtonLeftFoot::State::Button_On;
	_states[2] = new FSMSMButtonLeftFoot::State::Button_Off;
	_states[3] = new FSMSMButtonLeftFoot::State::Long_Press;
	_states[4] = new FSMSMButtonLeftFoot::State::Zero;

	setInitialState(_states[0]);            // set initial state
}

SMButtonLeftFoot::~SMButtonLeftFoot()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
