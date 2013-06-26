//
// SMReadyFromAnywhere.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_DetermineOurHalf.h"
#include "State_StartFindingOponentGoal.h"
#include "State_SpinAround.h"
#include "State_ReadHeadingAgain.h"
#include "State_CallFindGoal.h"
#include "State_OurHalfFacingUp.h"
#include "State_DirectlyLookingAtAGoal.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMReadyFromAnywhere *CLM_Create_SMReadyFromAnywhere(int mid, const char *name)
	{
		return new SMReadyFromAnywhere(mid, name);
	}
}

SMReadyFromAnywhere::SMReadyFromAnywhere(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMReadyFromAnywhere::State::Init;
	_states[1] = new FSMSMReadyFromAnywhere::State::SUSPENDED;
	_states[2] = new FSMSMReadyFromAnywhere::State::DetermineOurHalf;
	_states[3] = new FSMSMReadyFromAnywhere::State::StartFindingOponentGoal;
	_states[4] = new FSMSMReadyFromAnywhere::State::SpinAround;
	_states[5] = new FSMSMReadyFromAnywhere::State::ReadHeadingAgain;
	_states[6] = new FSMSMReadyFromAnywhere::State::CallFindGoal;
	_states[7] = new FSMSMReadyFromAnywhere::State::OurHalfFacingUp;
	_states[8] = new FSMSMReadyFromAnywhere::State::DirectlyLookingAtAGoal;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMReadyFromAnywhere::~SMReadyFromAnywhere()
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
}
