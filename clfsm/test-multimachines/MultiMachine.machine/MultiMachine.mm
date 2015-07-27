//
// MultiMachine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "MultiMachine_Includes.h"
#include "MultiMachine.h"

#include "State_InitialPseudoState.h"
#include "State_Initial.h"
#include "State_State_2.h"
#include "State_State_3.h"
#include "State_Exit.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	MultiMachine *CLM_Create_MultiMachine(int mid, const char *name)
	{
		return new MultiMachine(mid, name);
	}
}

MultiMachine::MultiMachine(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMMultiMachine::State::InitialPseudoState;
	_states[1] = new FSMMultiMachine::State::Initial;
	_states[2] = new FSMMultiMachine::State::State_2;
	_states[3] = new FSMMultiMachine::State::State_3;
	_states[4] = new FSMMultiMachine::State::Exit;

	setInitialState(_states[0]);            // set initial state
}

MultiMachine::~MultiMachine()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
}
