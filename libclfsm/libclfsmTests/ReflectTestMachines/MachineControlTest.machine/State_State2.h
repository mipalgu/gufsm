//
//State_State2.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__MachineControlTest_State_State2_h__
#define __clfsm__MachineControlTest_State_State2_h__

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
	namespace CLM
	{
		namespace FSMMachineControlTest
		{
			namespace State
			{
				class State2: public CLState
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
					State2(const char *name = "State2");
					virtual ~State2();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 0; }

#					include "State_State2_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__MachineControlTest_State_State2__)
