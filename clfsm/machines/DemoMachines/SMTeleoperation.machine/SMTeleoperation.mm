//
// SMTeleoperation.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperation_Includes.h"
#include "SMTeleoperation.h"

#include "State_Init.h"
#include "State_SUSPENDED.h"
#include "State_Sitting.h"
#include "State_Stand.h"
#include "State_Standing.h"
#include "State_Sit.h"
#include "State_Walk.h"
#include "State_Disconnect.h"
#include "State_Stop.h"
#include "State_Action.h"
#include "State_Connect.h"
#include "State_Connected.h"
#include "State_StartHeadTracking.h"
#include "State_Restart.h"
#include "State_ReadyConnect.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMTeleoperation *CLM_Create_SMTeleoperation(int mid, const char *name)
	{
		return new SMTeleoperation(mid, name);
	}
}

SMTeleoperation::SMTeleoperation(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMTeleoperation::State::Init;
	_states[1] = new FSMSMTeleoperation::State::SUSPENDED;
	_states[2] = new FSMSMTeleoperation::State::Sitting;
	_states[3] = new FSMSMTeleoperation::State::Stand;
	_states[4] = new FSMSMTeleoperation::State::Standing;
	_states[5] = new FSMSMTeleoperation::State::Sit;
	_states[6] = new FSMSMTeleoperation::State::Walk;
	_states[7] = new FSMSMTeleoperation::State::Disconnect;
	_states[8] = new FSMSMTeleoperation::State::Stop;
	_states[9] = new FSMSMTeleoperation::State::Action;
	_states[10] = new FSMSMTeleoperation::State::Connect;
	_states[11] = new FSMSMTeleoperation::State::Connected;
	_states[12] = new FSMSMTeleoperation::State::StartHeadTracking;
	_states[13] = new FSMSMTeleoperation::State::Restart;
	_states[14] = new FSMSMTeleoperation::State::ReadyConnect;

	setInitialState(_states[0]);            // set initial state
}

SMTeleoperation::~SMTeleoperation()
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
}
