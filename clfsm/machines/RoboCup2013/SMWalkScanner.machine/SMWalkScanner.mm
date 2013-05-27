//
// SMWalkScanner.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"

#include "State_INIT.h"
#include "State_Main.h"
#include "State_LeftWalk1.h"
#include "State_Continue.h"
#include "State_Forward.h"
#include "State_BACK.h"
#include "State_ALTERNATE1.h"
#include "State_RightWalk1.h"
#include "State_ALTERNATE2.h"
#include "State_RightWalk2.h"
#include "State_LeftWalk2.h"
#include "State_DCM_ON.h"
#include "State_SUSPENDED.h"

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
	_states[2] = new FSMSMWalkScanner::State::LeftWalk1;
	_states[3] = new FSMSMWalkScanner::State::Continue;
	_states[4] = new FSMSMWalkScanner::State::Forward;
	_states[5] = new FSMSMWalkScanner::State::BACK;
	_states[6] = new FSMSMWalkScanner::State::ALTERNATE1;
	_states[7] = new FSMSMWalkScanner::State::RightWalk1;
	_states[8] = new FSMSMWalkScanner::State::ALTERNATE2;
	_states[9] = new FSMSMWalkScanner::State::RightWalk2;
	_states[10] = new FSMSMWalkScanner::State::LeftWalk2;
	_states[11] = new FSMSMWalkScanner::State::DCM_ON;
	_states[12] = new FSMSMWalkScanner::State::SUSPENDED;

	setSuspendState(_states[12]);            // set suspend state
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
	delete _states[9];
	delete _states[10];
	delete _states[11];
	delete _states[12];
}
