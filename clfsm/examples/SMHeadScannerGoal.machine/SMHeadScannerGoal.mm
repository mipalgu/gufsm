//
// SMHeadScannerGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScannerGoal_Includes.h"
#include "SMHeadScannerGoal.h"

#include "State_Init.h"
#include "State_Start.h"
#include "State_Left_Mid_Scan.h"
#include "State_Right_Long_Scan.h"
#include "State_Left_Bottom_Scan.h"
#include "State_Right_Bottom_Scan.h"
#include "State_Left_Low_Scan.h"
#include "State_Right_Low_Scan.h"
#include "State_Left_High_Scan.h"
#include "State_Right_High_Scan.h"

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
	_states[1] = new FSMSMHeadScannerGoal::State::Start;
	_states[2] = new FSMSMHeadScannerGoal::State::Left_Mid_Scan;
	_states[3] = new FSMSMHeadScannerGoal::State::Right_Long_Scan;
	_states[4] = new FSMSMHeadScannerGoal::State::Left_Bottom_Scan;
	_states[5] = new FSMSMHeadScannerGoal::State::Right_Bottom_Scan;
	_states[6] = new FSMSMHeadScannerGoal::State::Left_Low_Scan;
	_states[7] = new FSMSMHeadScannerGoal::State::Right_Low_Scan;
	_states[8] = new FSMSMHeadScannerGoal::State::Left_High_Scan;
	_states[9] = new FSMSMHeadScannerGoal::State::Right_High_Scan;

	setInitialState(_states[0]);            // set initial state
}

SMHeadScannerGoal::~SMHeadScannerGoal()
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
}
