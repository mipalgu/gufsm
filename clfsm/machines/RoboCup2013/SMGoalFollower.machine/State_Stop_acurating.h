//
// State_Stop_acurating.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGoalFollower_State_Stop_acurating_h
#define clfsm_SMGoalFollower_State_Stop_acurating_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMGoalFollower
      {
        namespace State
        {
            class Stop_acurating: public CLState
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
                    Stop_acurating(const char *name = "Stop_acurating");
                    virtual ~Stop_acurating();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Stop_acurating_Variables.h"
            };
        }
      }
    }
}

#endif
