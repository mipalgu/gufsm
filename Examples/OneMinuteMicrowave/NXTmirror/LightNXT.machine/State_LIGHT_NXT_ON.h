//
//State_LIGHT_NXT_ON.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__LightNXT_State_LIGHT_NXT_ON_h__
#define __clfsm__LightNXT_State_LIGHT_NXT_ON_h__

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
	namespace CLM
	{
		namespace FSMLightNXT
		{
			namespace State
			{
				class LIGHT_NXT_ON: public CLState
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
					class Transition_0: public CLTransition
					{
						public:
						Transition_0(int toState = 1): CLTransition(toState) {}

						virtual bool check(CLMachine *, CLState *) const;
					};


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wzero-length-array"
				CLTransition *_transitions[1];
				public:
					LIGHT_NXT_ON(const char *name = "LIGHT_NXT_ON");
					virtual ~LIGHT_NXT_ON();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 1; }

#					include "State_LIGHT_NXT_ON_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__LightNXT_State_LIGHT_NXT_ON__)
