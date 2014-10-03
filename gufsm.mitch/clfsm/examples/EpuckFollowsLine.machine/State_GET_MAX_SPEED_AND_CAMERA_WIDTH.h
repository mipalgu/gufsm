//
//State_GET_MAX_SPEED_AND_CAMERA_WIDTH.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__EpuckFollowsLine_State_GET_MAX_SPEED_AND_CAMERA_WIDTH_h__
#define __clfsm__EpuckFollowsLine_State_GET_MAX_SPEED_AND_CAMERA_WIDTH_h__

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
	namespace CLM
	{
		namespace FSMEpuckFollowsLine
		{
			namespace State
			{
				class GET_MAX_SPEED_AND_CAMERA_WIDTH: public CLState
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
					GET_MAX_SPEED_AND_CAMERA_WIDTH(const char *name = "GET_MAX_SPEED_AND_CAMERA_WIDTH");
					virtual ~GET_MAX_SPEED_AND_CAMERA_WIDTH();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 0; }

#					include "State_GET_MAX_SPEED_AND_CAMERA_WIDTH_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__EpuckFollowsLine_State_GET_MAX_SPEED_AND_CAMERA_WIDTH__)
