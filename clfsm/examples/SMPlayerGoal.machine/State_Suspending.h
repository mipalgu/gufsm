//
// State_Suspending.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMPlayerGoal_State_Suspending_h
#define clfsm_SMPlayerGoal_State_Suspending_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMPlayerGoal
      {
        namespace State
        {
            class Suspending: public CLState
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

                CLTransition *_transitions[1];

                public:
                    Suspending(const char *name = "Suspending");
                    virtual ~Suspending();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Suspending_Variables.h"
            };
        }
      }
    }
}

#endif
