//
// SLAM.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"

#include "State_Initial.h"
#include "State_SearchForLine.h"
#include "State_FollowLine.h"
#include "State_RightTurn.h"
#include "State_LeftTurn.h"
#include "State_Landmark.h"
#include "State_RightCrossing.h"
#include "State_Junction.h"
#include "State_LeftCrossing.h"
#include "State_TCross.h"
#include "State_EndOfTheLine.h"
#include "State_Debounce.h"
#include "State_OdometryTestState.h"
#include "State_CalcLeft.h"
#include "State_CalcRight.h"
#include "State_StopState.h"
#include "State_State_1.h"
#include "State_State_2.h"
#include "State_TestZ.h"
#include "State_TestTurn.h"
#include "State_TestY.h"
#include "State_TestStop.h"
#include "State_State_3.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SLAM *CLM_Create_SLAM(int mid, const char *name)
	{
		return new SLAM(mid, name);
	}
}

SLAM::SLAM(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSLAM::State::Initial;
	_states[1] = new FSMSLAM::State::SearchForLine;
	_states[2] = new FSMSLAM::State::FollowLine;
	_states[3] = new FSMSLAM::State::RightTurn;
	_states[4] = new FSMSLAM::State::LeftTurn;
	_states[5] = new FSMSLAM::State::Landmark;
	_states[6] = new FSMSLAM::State::RightCrossing;
	_states[7] = new FSMSLAM::State::Junction;
	_states[8] = new FSMSLAM::State::LeftCrossing;
	_states[9] = new FSMSLAM::State::TCross;
	_states[10] = new FSMSLAM::State::EndOfTheLine;
	_states[11] = new FSMSLAM::State::Debounce;
	_states[12] = new FSMSLAM::State::OdometryTestState;
	_states[13] = new FSMSLAM::State::CalcLeft;
	_states[14] = new FSMSLAM::State::CalcRight;
	_states[15] = new FSMSLAM::State::StopState;
	_states[16] = new FSMSLAM::State::State_1;
	_states[17] = new FSMSLAM::State::State_2;
	_states[18] = new FSMSLAM::State::TestZ;
	_states[19] = new FSMSLAM::State::TestTurn;
	_states[20] = new FSMSLAM::State::TestY;
	_states[21] = new FSMSLAM::State::TestStop;
	_states[22] = new FSMSLAM::State::State_3;

	setInitialState(_states[0]);            // set initial state
}

SLAM::~SLAM()
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
	delete _states[19];
	delete _states[20];
	delete _states[21];
	delete _states[22];
}
