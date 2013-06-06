//
// SMWalkScannerGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScannerGoal_Includes.h"
#include "SMWalkScannerGoal.h"

#include "State_Init.h"
#include "State_DCM_ON.h"
#include "State_Main.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMWalkScannerGoal *CLM_Create_SMWalkScannerGoal(int mid, const char *name)
	{
		return new SMWalkScannerGoal(mid, name);
	}
}

SMWalkScannerGoal::SMWalkScannerGoal(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMWalkScannerGoal::State::Init;
	_states[1] = new FSMSMWalkScannerGoal::State::DCM_ON;
	_states[2] = new FSMSMWalkScannerGoal::State::Main;

	setInitialState(_states[0]);            // set initial state
}

SMWalkScannerGoal::~SMWalkScannerGoal()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
}
