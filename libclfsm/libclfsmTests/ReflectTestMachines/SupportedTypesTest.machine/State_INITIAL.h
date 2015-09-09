//
//State_INITIAL.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__SupportedTypesTest_State_INITIAL_h__
#define __clfsm__SupportedTypesTest_State_INITIAL_h__

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
	namespace CLM
	{
		namespace FSMSupportedTypesTest
		{
			namespace State
			{
				class INITIAL: public CLState
				{
					class OnEntry: public CLAction
					{
						virtual void perform(CLMachine *, CLState *) const;
					};
					class OnExit: public CLAction
					{
						virtual void perform(CLMachine *, CLState *) const;
					};
					class Internal: public CLAction
					{
						virtual void perform(CLMachine *, CLState *) const;
					};

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wzero-length-array"
				CLTransition *_transitions[0];
				public:
					INITIAL(const char *name = "INITIAL");
					virtual ~INITIAL();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 0; }

#					include "State_INITIAL_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__SupportedTypesTest_State_INITIAL__)
