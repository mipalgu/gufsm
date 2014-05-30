//
//State_OTHER.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__TestSuspend_State_OTHER_h__
#define __clfsm__TestSuspend_State_OTHER_h__

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
	namespace CLM
	{
		namespace FSMTestSuspend
		{
			namespace State
			{
				class OTHER: public CLState
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
					OTHER(const char *name = "OTHER");
					virtual ~OTHER();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 1; }

#					include "State_OTHER_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__TestSuspend_State_OTHER__)
