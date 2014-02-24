//
//MotorNXT.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__MotorNXT__
#define __clfsm__MotorNXT__

#include "CLMachine.h"

namespace FSM
{
	class CLState;

	namespace CLM
	{
		class MotorNXT: public CLMachine
		{
			CLState *_states[3];
			public:
			MotorNXT(int mid  = 0, const char *name = "MotorNXT");
			virtual ~MotorNXT();
			virtual CLState * const * states() const { return _states; }
			virtual int numberOfStates() const { return 3; }
#			include "MotorNXT_Variables.h"
		};
	}
}

extern "C"
{
	FSM::CLM::MotorNXT *CLM_Create_MotorNXT(int mid, const char *name);
}

#endif // defined(__gufsm__MotorNXT__)
