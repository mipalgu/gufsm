//
// SMGoalApproach.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalApproach_Includes.h"
#include "SMGoalApproach.h"

#include "State_Init.h"
#include "State_Calculate_way.h"
#include "State_Align_body.h"
#include "State_Approach.h"
#include "State_Stop.h"
#include "State_Head_Scan.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMGoalApproach *CLM_Create_SMGoalApproach(int mid, const char *name)
	{
		return new SMGoalApproach(mid, name);
	}
}

SMGoalApproach::SMGoalApproach(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMGoalApproach::State::Init;
	_states[1] = new FSMSMGoalApproach::State::Calculate_way;
	_states[2] = new FSMSMGoalApproach::State::Align_body;
	_states[3] = new FSMSMGoalApproach::State::Approach;
	_states[4] = new FSMSMGoalApproach::State::Stop;
	_states[5] = new FSMSMGoalApproach::State::Head_Scan;

	setInitialState(_states[0]);            // set initial state
}

SMGoalApproach::~SMGoalApproach()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
}
