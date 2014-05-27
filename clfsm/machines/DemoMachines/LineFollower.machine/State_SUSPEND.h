//
//State_SUSPEND.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__LineFollower_State_SUSPEND_h__
#define __clfsm__LineFollower_State_SUSPEND_h__

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
	namespace CLM
	{
		namespace FSMLineFollower
		{
			namespace State
			{
				class SUSPEND: public CLState
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
					SUSPEND(const char *name = "SUSPEND");
					virtual ~SUSPEND();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 0; }

#					include "State_SUSPEND_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__LineFollower_State_SUSPEND__)
