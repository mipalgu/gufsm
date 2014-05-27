//
//State_TURN_ON_CAMERA.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__LineFollower_State_TURN_ON_CAMERA_h__
#define __clfsm__LineFollower_State_TURN_ON_CAMERA_h__

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
				class TURN_ON_CAMERA: public CLState
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
					TURN_ON_CAMERA(const char *name = "TURN_ON_CAMERA");
					virtual ~TURN_ON_CAMERA();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 1; }

#					include "State_TURN_ON_CAMERA_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__LineFollower_State_TURN_ON_CAMERA__)
