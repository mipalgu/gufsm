//
// State_Transitions.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_CLReflectDemo_State_Transitions_h
#define clfsm_CLReflectDemo_State_Transitions_h

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

                class Transition_0: public CLTransition
                {
                public:
                    Transition_0(int toState = 7): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Transitions(const char *name = "Transitions");
                    virtual ~Transitions();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Transitions_Variables.h"
            };
        }
      }
    }
}

#endif
