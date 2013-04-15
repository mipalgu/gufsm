//
// State_Wait.h -- 2013-04-15 04:08:33 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_ControlExample_State_Wait_h
#define clfsm_ControlExample_State_Wait_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMControlExample
      {
        namespace State
        {
            class Wait: public CLState
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
                    Transition_0(int toState = 6): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Wait(const char *name = "Wait");
                    virtual ~Wait();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Wait_Variables.h"
            };
        }
      }
    }
}

#endif
