//
//SupportedTypesTest.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__SupportedTypesTest__
#define __clfsm__SupportedTypesTest__

#include "CLMachine.h"

namespace FSM
{
	class CLState;

	namespace CLM
	{
		class SupportedTypesTest: public CLMachine
		{
			CLState *_states[1];
			public:
			SupportedTypesTest(int mid  = 0, const char *name = "SupportedTypesTest");
			virtual ~SupportedTypesTest();
			virtual CLState * const * states() const { return _states; }
			virtual int numberOfStates() const { return 1; }
#			include "SupportedTypesTest_Variables.h"
		};
	}
}

extern "C"
{
	FSM::CLM::SupportedTypesTest *CLM_Create_SupportedTypesTest(int mid, const char *name);
}

#endif // defined(__gufsm__SupportedTypesTest__)
