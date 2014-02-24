//
//State_BUTTON_RELEASED.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__buttonNXT_State_BUTTON_RELEASED_h__
#define __clfsm__buttonNXT_State_BUTTON_RELEASED_h__

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
	namespace CLM
	{
		namespace FSMbuttonNXT
		{
			namespace State
			{
				class BUTTON_RELEASED: public CLState
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
					BUTTON_RELEASED(const char *name = "BUTTON_RELEASED");
					virtual ~BUTTON_RELEASED();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 0; }

#					include "State_BUTTON_RELEASED_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__buttonNXT_State_BUTTON_RELEASED__)
