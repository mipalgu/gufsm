//
//MachineControlTest.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__MachineControlTest__
#define __clfsm__MachineControlTest__

#include "CLMachine.h"

namespace FSM
{
	class CLState;

	namespace CLM
	{
		class MachineControlTest: public CLMachine
		{
			CLState *_states[3];
			public:
			MachineControlTest(int mid  = 0, const char *name = "MachineControlTest");
			virtual ~MachineControlTest();
			virtual CLState * const * states() const { return _states; }
			virtual int numberOfStates() const { return 3; }
#			include "MachineControlTest_Variables.h"
		};
	}
}

extern "C"
{
	FSM::CLM::MachineControlTest *CLM_Create_MachineControlTest(int mid, const char *name);
}

#endif // defined(__gufsm__MachineControlTest__)
