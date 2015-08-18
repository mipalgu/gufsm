//
//State_Transitions.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#ifndef __clfsm__CLReflectDemo_State_Transitions_h__
#define __clfsm__CLReflectDemo_State_Transitions_h__

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
	namespace CLM
	{
		namespace FSMCLReflectDemo
		{
			namespace State
			{
				class Transitions: public CLState
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
					Transitions(const char *name = "Transitions");
					virtual ~Transitions();

					virtual CLTransition * const *transitions() const { return _transitions; }
					virtual int numberOfTransitions() const { return 0; }

#					include "State_Transitions_Variables.h"
#pragma clang diagnostic pop
				};
			}
		}
	}
}
#endif // defined(__gufsm__CLReflectDemo_State_Transitions__)
