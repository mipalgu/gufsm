//
// StateMachineStarter.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"

#include "State_Init.h"
#include "State_Start_Default_Machines.h"
#include "State_Start_GC.h"
#include "State_Restart_FSMs.h"
#include "State_Control_State.h"
#include "State_Say_IP.h"
#include "State_Alt_Test_State.h"
#include "State_Spacing.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	StateMachineStarter *CLM_Create_StateMachineStarter(int mid, const char *name)
	{
		return new StateMachineStarter(mid, name);
	}
}

StateMachineStarter::StateMachineStarter(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMStateMachineStarter::State::Init;
	_states[1] = new FSMStateMachineStarter::State::Start_Default_Machines;
	_states[2] = new FSMStateMachineStarter::State::Start_GC;
	_states[3] = new FSMStateMachineStarter::State::Restart_FSMs;
	_states[4] = new FSMStateMachineStarter::State::Control_State;
	_states[5] = new FSMStateMachineStarter::State::Say_IP;
	_states[6] = new FSMStateMachineStarter::State::Alt_Test_State;
	_states[7] = new FSMStateMachineStarter::State::Spacing;

	setInitialState(_states[0]);            // set initial state
}

StateMachineStarter::~StateMachineStarter()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
}