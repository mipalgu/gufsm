//
// SMHeadScannerGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScannerGoal_Includes.h"
#include "SMHeadScannerGoal.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_High_Scan.h"
#include "State_Start.h"
#include "State_Do_High_Scan.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMHeadScannerGoal *CLM_Create_SMHeadScannerGoal(int mid, const char *name)
	{
		return new SMHeadScannerGoal(mid, name);
	}
}

SMHeadScannerGoal::SMHeadScannerGoal(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMHeadScannerGoal::State::Init;
	_states[1] = new FSMSMHeadScannerGoal::State::SUSPENDED;
	_states[2] = new FSMSMHeadScannerGoal::State::High_Scan;
	_states[3] = new FSMSMHeadScannerGoal::State::Start;
	_states[4] = new FSMSMHeadScannerGoal::State::Do_High_Scan;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMHeadScannerGoal::~SMHeadScannerGoal()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
