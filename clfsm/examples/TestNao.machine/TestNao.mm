//
// TestNao.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "TestNao_Includes.h"
#include "TestNao.h"

#include "State_INITIAL.h"
#include "State_FOLLOW_LINE.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	TestNao *CLM_Create_TestNao(int mid, const char *name)
	{
		return new TestNao(mid, name);
	}
}

TestNao::TestNao(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMTestNao::State::INITIAL;
	_states[1] = new FSMTestNao::State::FOLLOW_LINE;

	setInitialState(_states[0]);            // set initial state
}

TestNao::~TestNao()
{
	delete _states[0];
	delete _states[1];
}
