//
// SMHeadScanner.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScanner_Includes.h"
#include "SMHeadScanner.h"

#include "State_Init.h"
#include "State_Bottom_Scan.h"
#include "State_SUSPENDED.h"
#include "State_Start.h"
#include "State_Do_Bottom_Scan.h"
#include "State_Stop.h"
#include "State_SuspendSelf.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMHeadScanner *CLM_Create_SMHeadScanner(int mid, const char *name)
	{
		return new SMHeadScanner(mid, name);
	}
}

SMHeadScanner::SMHeadScanner(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMHeadScanner::State::(null);
	_states[1] = new FSMSMHeadScanner::State::(null);
	_states[2] = new FSMSMHeadScanner::State::(null);
	_states[3] = new FSMSMHeadScanner::State::(null);
	_states[4] = new FSMSMHeadScanner::State::(null);
	_states[5] = new FSMSMHeadScanner::State::(null);
	_states[6] = new FSMSMHeadScanner::State::(null);

	setSuspendState(_states[2]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMHeadScanner::~SMHeadScanner()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
}
