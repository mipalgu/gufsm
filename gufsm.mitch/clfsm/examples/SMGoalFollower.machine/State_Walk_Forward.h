//
// State_Walk_Forward.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGoalFollower_State_Walk_Forward_h
#define clfsm_SMGoalFollower_State_Walk_Forward_h

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
            class Walk_Forward: public CLState
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
                    Walk_Forward(const char *name = "Walk_Forward");
                    virtual ~Walk_Forward();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Walk_Forward_Variables.h"
            };
        }
      }
    }
}

#endif
