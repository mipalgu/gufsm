//
//VariableTests.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__VariableTests__
#define __clfsm__VariableTests__

#include "CLMachine.h"

namespace FSM
{
	class CLState;

	namespace CLM
	{
		class VariableTests: public CLMachine
		{
			CLState *_states[1];
			public:
			VariableTests(int mid  = 0, const char *name = "VariableTests");
			virtual ~VariableTests();
			virtual CLState * const * states() const { return _states; }
			virtual int numberOfStates() const { return 1; }
#			include "VariableTests_Variables.h"
		};
	}
}

extern "C"
{
	FSM::CLM::VariableTests *CLM_Create_VariableTests(int mid, const char *name);
}

#endif // defined(__gufsm__VariableTests__)
