//
// SMPlayer.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"

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
	SMPlayer *CLM_Create_SMPlayer(int mid, const char *name)
	{
		return new SMPlayer(mid, name);
	}
}

SMPlayer::SMPlayer(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMPlayer::State::Init;
	_states[1] = new FSMSMPlayer::State::SUSPENDED;
	_states[2] = new FSMSMPlayer::State::DetermineOurHalf;
	_states[3] = new FSMSMPlayer::State::StartFindingOponentGoal;
	_states[4] = new FSMSMPlayer::State::SpinAround;
	_states[5] = new FSMSMPlayer::State::ReadHeadingAgain;
	_states[6] = new FSMSMPlayer::State::CallFindGoal;
	_states[7] = new FSMSMPlayer::State::OurHalfFacingUp;
	_states[8] = new FSMSMPlayer::State::DirectlyLookingAtAGoal;
	_states[9] = new FSMSMPlayer::State::StartFindingOurGoal;
	_states[10] = new FSMSMPlayer::State::CheckHowFarIsTheGoal;
	_states[11] = new FSMSMPlayer::State::TooCloseSpinAround;
	_states[12] = new FSMSMPlayer::State::leftVisible;
	_states[13] = new FSMSMPlayer::State::rightVisible;
	_states[14] = new FSMSMPlayer::State::WalkAllTheWay;
	_states[15] = new FSMSMPlayer::State::readDistance;
	_states[16] = new FSMSMPlayer::State::checkDistance;
	_states[17] = new FSMSMPlayer::State::StopWalkAllTheWay;
	_states[18] = new FSMSMPlayer::State::checkDistanceRightPost;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMPlayer::~SMPlayer()
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
