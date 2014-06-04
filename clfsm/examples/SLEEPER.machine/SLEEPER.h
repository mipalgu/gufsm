//
//SLEEPER.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__SLEEPER__
#define __clfsm__SLEEPER__

#include "CLMachine.h"

namespace FSM
{
	class CLState;

	namespace CLM
	{
		class SLEEPER: public CLMachine
		{
			CLState *_states[2];
			public:
			SLEEPER(int mid  = 0, const char *name = "SLEEPER");
			virtual ~SLEEPER();
			virtual CLState * const * states() const { return _states; }
			virtual int numberOfStates() const { return 2; }
#			include "SLEEPER_Variables.h"
		};
	}
}

extern "C"
{
	FSM::CLM::SLEEPER *CLM_Create_SLEEPER(int mid, const char *name);
}

#endif // defined(__gufsm__SLEEPER__)
