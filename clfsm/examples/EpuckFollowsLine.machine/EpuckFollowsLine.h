//
//EpuckFollowsLine.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__EpuckFollowsLine__
#define __clfsm__EpuckFollowsLine__

#include "CLMachine.h"

namespace FSM
{
	class CLState;

	namespace CLM
	{
		class EpuckFollowsLine: public CLMachine
		{
			CLState *_states[5];
			public:
			EpuckFollowsLine(int mid  = 0, const char *name = "EpuckFollowsLine");
			virtual ~EpuckFollowsLine();
			virtual CLState * const * states() const { return _states; }
			virtual int numberOfStates() const { return 5; }
#			include "EpuckFollowsLine_Variables.h"
		};
	}
}

extern "C"
{
	FSM::CLM::EpuckFollowsLine *CLM_Create_EpuckFollowsLine(int mid, const char *name);
}

#endif // defined(__gufsm__EpuckFollowsLine__)
