//
// State_Goal_Approach.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGoalFollower_State_Goal_Approach_h
#define clfsm_SMGoalFollower_State_Goal_Approach_h

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
            class Goal_Approach: public CLState
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
                    Goal_Approach(const char *name = "Goal_Approach");
                    virtual ~Goal_Approach();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Goal_Approach_Variables.h"
            };
        }
      }
    }
}

#endif
