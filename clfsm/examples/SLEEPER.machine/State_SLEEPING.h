//
//State_SLEEPING.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__SLEEPER_State_SLEEPING_h__
#define __clfsm__SLEEPER_State_SLEEPING_h__

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
	namespace CLM
	{
		namespace FSMSLEEPER
		{
			namespace State
			{
				class SLEEPING: public CLState
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
						Transition_0(int toState = 0): CLTransition(toState) {}

						virtual bool check(CLMachine *, CLState *) const;
					};


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wzero-length-array"
				CLTransition *_transitions[1];
				public:
					SLEEPING(const char *name = "SLEEPING");
					virtual ~SLEEPING();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 1; }

#					include "State_SLEEPING_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__SLEEPER_State_SLEEPING__)
