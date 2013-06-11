//
// State_Suspending_Scanner.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMPlayerGoal_State_Suspending_Scanner_h
#define clfsm_SMPlayerGoal_State_Suspending_Scanner_h

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
            class Suspending_Scanner: public CLState
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

                CLTransition *_transitions[1];

                public:
                    Suspending_Scanner(const char *name = "Suspending_Scanner");
                    virtual ~Suspending_Scanner();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Suspending_Scanner_Variables.h"
            };
        }
      }
    }
}

#endif
