//
//State_SET_MOTOR_SPEED.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__LineFollower_State_SET_MOTOR_SPEED_h__
#define __clfsm__LineFollower_State_SET_MOTOR_SPEED_h__

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
				class SET_MOTOR_SPEED: public CLState
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
						Transition_0(int toState = 3): CLTransition(toState) {}

						virtual bool check(CLMachine *, CLState *) const;
					};


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wzero-length-array"
				CLTransition *_transitions[1];
				public:
					SET_MOTOR_SPEED(const char *name = "SET_MOTOR_SPEED");
					virtual ~SET_MOTOR_SPEED();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 1; }

#					include "State_SET_MOTOR_SPEED_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__LineFollower_State_SET_MOTOR_SPEED__)
