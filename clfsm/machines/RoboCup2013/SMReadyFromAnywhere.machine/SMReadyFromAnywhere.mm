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
#include "State_StartFindingOurGoal.h"
#include "State_CheckHowFarIsTheGoal.h"
#include "State_TooCloseSpinAround.h"
#include "State_leftVisible.h"
#include "State_rightVisible.h"
#include "State_WalkAllTheWay.h"
#include "State_readDistance.h"
#include "State_checkDistance.h"
#include "State_StopWalkAllTheWay.h"
#include "State_checkDistanceRightPost.h"

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
	_states[9] = new FSMSMReadyFromAnywhere::State::StartFindingOurGoal;
	_states[10] = new FSMSMReadyFromAnywhere::State::CheckHowFarIsTheGoal;
	_states[11] = new FSMSMReadyFromAnywhere::State::TooCloseSpinAround;
	_states[12] = new FSMSMReadyFromAnywhere::State::leftVisible;
	_states[13] = new FSMSMReadyFromAnywhere::State::rightVisible;
	_states[14] = new FSMSMReadyFromAnywhere::State::WalkAllTheWay;
	_states[15] = new FSMSMReadyFromAnywhere::State::readDistance;
	_states[16] = new FSMSMReadyFromAnywhere::State::checkDistance;
	_states[17] = new FSMSMReadyFromAnywhere::State::StopWalkAllTheWay;
	_states[18] = new FSMSMReadyFromAnywhere::State::checkDistanceRightPost;

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
	delete _states[9];
	delete _states[10];
	delete _states[11];
	delete _states[12];
	delete _states[13];
	delete _states[14];
	delete _states[15];
	delete _states[16];
	delete _states[17];
	delete _states[18];
}
