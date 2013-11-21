//
// SMWalkScanner.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"

#include "State_INIT.h"
#include "State_Main.h"
#include "State_WalkForward.h"
#include "State_Spin.h"
#include "State_DCM_ON.h"
#include "State_SUSPENDED.h"
#include "State_Wait.h"
#include "State_Decide.h"
#include "State_Stop.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMWalkScanner *CLM_Create_SMWalkScanner(int mid, const char *name)
	{
		return new SMWalkScanner(mid, name);
	}
}

SMWalkScanner::SMWalkScanner(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMWalkScanner::State::INIT;
	_states[1] = new FSMSMWalkScanner::State::Main;
	_states[2] = new FSMSMWalkScanner::State::WalkForward;
	_states[3] = new FSMSMWalkScanner::State::Spin;
	_states[4] = new FSMSMWalkScanner::State::DCM_ON;
	_states[5] = new FSMSMWalkScanner::State::SUSPENDED;
	_states[6] = new FSMSMWalkScanner::State::Wait;
	_states[7] = new FSMSMWalkScanner::State::Decide;
	_states[8] = new FSMSMWalkScanner::State::Stop;

	setSuspendState(_states[5]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMWalkScanner::~SMWalkScanner()
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
