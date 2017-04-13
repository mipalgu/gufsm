//
//WhiteboardVariableTest.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__WhiteboardVariableTest__
#define __clfsm__WhiteboardVariableTest__

#include "CLMachine.h"

namespace FSM
{
	class CLState;

	namespace CLM
	{
		class WhiteboardVariableTest: public CLMachine
		{
			CLState *_states[1];
			public:
			WhiteboardVariableTest(int mid  = 0, const char *name = "WhiteboardVariableTest");
			virtual ~WhiteboardVariableTest();
			virtual CLState * const * states() const { return _states; }
			virtual int numberOfStates() const { return 1; }
#			include "WhiteboardVariableTest_Variables.h"
		};
	}
}

extern "C"
{
	FSM::CLM::WhiteboardVariableTest *CLM_Create_WhiteboardVariableTest(int mid, const char *name);
}

#endif // defined(__gufsm__WhiteboardVariableTest__)
