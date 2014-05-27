//
//LineFollower.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__LineFollower__
#define __clfsm__LineFollower__

#include "CLMachine.h"

namespace FSM
{
	class CLState;

	namespace CLM
	{
		class LineFollower: public CLMachine
		{
			CLState *_states[6];
			public:
			LineFollower(int mid  = 0, const char *name = "LineFollower");
			virtual ~LineFollower();
			virtual CLState * const * states() const { return _states; }
			virtual int numberOfStates() const { return 6; }
#			include "LineFollower_Variables.h"
		};
	}
}

extern "C"
{
	FSM::CLM::LineFollower *CLM_Create_LineFollower(int mid, const char *name);
}

#endif // defined(__gufsm__LineFollower__)
