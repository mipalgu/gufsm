//
//State_SuspendState.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__MachineControlTest_State_SuspendState_h__
#define __clfsm__MachineControlTest_State_SuspendState_h__

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
				class SuspendState: public CLState
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
					SuspendState(const char *name = "SuspendState");
					virtual ~SuspendState();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 0; }

#					include "State_SuspendState_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__MachineControlTest_State_SuspendState__)
