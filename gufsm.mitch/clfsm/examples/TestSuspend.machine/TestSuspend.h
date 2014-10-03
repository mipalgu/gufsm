//
//TestSuspend.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__TestSuspend__
#define __clfsm__TestSuspend__

#include "CLMachine.h"

namespace FSM
{
	class CLState;

	namespace CLM
	{
		class TestSuspend: public CLMachine
		{
			CLState *_states[3];
			public:
			TestSuspend(int mid  = 0, const char *name = "TestSuspend");
			virtual ~TestSuspend();
			virtual CLState * const * states() const { return _states; }
			virtual int numberOfStates() const { return 3; }
#			include "TestSuspend_Variables.h"
		};
	}
}

extern "C"
{
	FSM::CLM::TestSuspend *CLM_Create_TestSuspend(int mid, const char *name);
}

#endif // defined(__gufsm__TestSuspend__)
