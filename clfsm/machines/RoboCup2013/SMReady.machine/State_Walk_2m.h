//
// State_Walk_2m.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMReady_State_Walk_2m_h
#define clfsm_SMReady_State_Walk_2m_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMReady
      {
        namespace State
        {
            class Walk_2m: public CLState
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
                    Transition_0(int toState = 5): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Walk_2m(const char *name = "Walk_2m");
                    virtual ~Walk_2m();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Walk_2m_Variables.h"
            };
        }
      }
    }
}

#endif
