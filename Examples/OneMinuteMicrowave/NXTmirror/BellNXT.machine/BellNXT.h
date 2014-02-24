//
//BellNXT.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__BellNXT__
#define __clfsm__BellNXT__

#include "CLMachine.h"

namespace FSM
{
	class CLState;

	namespace CLM
	{
		class BellNXT: public CLMachine
		{
			CLState *_states[3];
			public:
			BellNXT(int mid  = 0, const char *name = "BellNXT");
			virtual ~BellNXT();
			virtual CLState * const * states() const { return _states; }
			virtual int numberOfStates() const { return 3; }
#			include "BellNXT_Variables.h"
		};
	}
}

extern "C"
{
	FSM::CLM::BellNXT *CLM_Create_BellNXT(int mid, const char *name);
}

#endif // defined(__gufsm__BellNXT__)
