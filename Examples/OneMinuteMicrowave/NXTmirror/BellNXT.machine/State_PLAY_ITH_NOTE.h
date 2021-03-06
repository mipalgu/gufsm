//
//State_PLAY_ITH_NOTE.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__BellNXT_State_PLAY_ITH_NOTE_h__
#define __clfsm__BellNXT_State_PLAY_ITH_NOTE_h__

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
	namespace CLM
	{
		namespace FSMBellNXT
		{
			namespace State
			{
				class PLAY_ITH_NOTE: public CLState
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
					PLAY_ITH_NOTE(const char *name = "PLAY_ITH_NOTE");
					virtual ~PLAY_ITH_NOTE();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 1; }

#					include "State_PLAY_ITH_NOTE_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__BellNXT_State_PLAY_ITH_NOTE__)
