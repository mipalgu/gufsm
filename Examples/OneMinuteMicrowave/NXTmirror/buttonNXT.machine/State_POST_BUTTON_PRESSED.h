//
//State_POST_BUTTON_PRESSED.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__buttonNXT_State_POST_BUTTON_PRESSED_h__
#define __clfsm__buttonNXT_State_POST_BUTTON_PRESSED_h__

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
				class POST_BUTTON_PRESSED: public CLState
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
					POST_BUTTON_PRESSED(const char *name = "POST_BUTTON_PRESSED");
					virtual ~POST_BUTTON_PRESSED();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 0; }

#					include "State_POST_BUTTON_PRESSED_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__buttonNXT_State_POST_BUTTON_PRESSED__)
