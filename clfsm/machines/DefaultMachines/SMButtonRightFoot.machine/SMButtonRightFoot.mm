//
// SMButtonRightFoot.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMButtonRightFoot_Includes.h"
#include "SMButtonRightFoot.h"

#include "State_Init.h"
#include "State_Button_On.h"
#include "State_Button_Off.h"
#include "State_Long_Press.h"
#include "State_Zero.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMButtonRightFoot *CLM_Create_SMButtonRightFoot(int mid, const char *name)
	{
		return new SMButtonRightFoot(mid, name);
	}
}

SMButtonRightFoot::SMButtonRightFoot(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMButtonRightFoot::State::Init;
	_states[1] = new FSMSMButtonRightFoot::State::Button_On;
	_states[2] = new FSMSMButtonRightFoot::State::Button_Off;
	_states[3] = new FSMSMButtonRightFoot::State::Long_Press;
	_states[4] = new FSMSMButtonRightFoot::State::Zero;

	setInitialState(_states[0]);            // set initial state
}

SMButtonRightFoot::~SMButtonRightFoot()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
