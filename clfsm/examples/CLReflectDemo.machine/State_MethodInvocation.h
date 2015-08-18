//
//State_MethodInvocation.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__CLReflectDemo_State_MethodInvocation_h__
#define __clfsm__CLReflectDemo_State_MethodInvocation_h__

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
	namespace CLM
	{
		namespace FSMCLReflectDemo
		{
			namespace State
			{
				class MethodInvocation: public CLState
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
					MethodInvocation(const char *name = "MethodInvocation");
					virtual ~MethodInvocation();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 0; }

#					include "State_MethodInvocation_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__CLReflectDemo_State_MethodInvocation__)
