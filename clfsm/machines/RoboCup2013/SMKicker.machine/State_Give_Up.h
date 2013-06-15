//
// State_Give_Up.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMKicker_State_Give_Up_h
#define clfsm_SMKicker_State_Give_Up_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMKicker
      {
        namespace State
        {
            class Give_Up: public CLState
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
                    Transition_0(int toState = 4): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Give_Up(const char *name = "Give_Up");
                    virtual ~Give_Up();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Give_Up_Variables.h"
            };
        }
      }
    }
}

#endif
