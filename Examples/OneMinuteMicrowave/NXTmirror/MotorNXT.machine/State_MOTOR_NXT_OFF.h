//
//State_MOTOR_NXT_OFF.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__MotorNXT_State_MOTOR_NXT_OFF_h__
#define __clfsm__MotorNXT_State_MOTOR_NXT_OFF_h__

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
	namespace CLM
	{
		namespace FSMMotorNXT
		{
			namespace State
			{
				class MOTOR_NXT_OFF: public CLState
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
						Transition_0(int toState = 2): CLTransition(toState) {}

						virtual bool check(CLMachine *, CLState *) const;
					};


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wzero-length-array"
				CLTransition *_transitions[1];
				public:
					MOTOR_NXT_OFF(const char *name = "MOTOR_NXT_OFF");
					virtual ~MOTOR_NXT_OFF();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 1; }

#					include "State_MOTOR_NXT_OFF_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__MotorNXT_State_MOTOR_NXT_OFF__)
