//
// State_Accurate_Left.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGoalFollower_State_Accurate_Left_h
#define clfsm_SMGoalFollower_State_Accurate_Left_h

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
            class Accurate_Left: public CLState
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
                    Transition_0(int toState = 8): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Accurate_Left(const char *name = "Accurate_Left");
                    virtual ~Accurate_Left();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Accurate_Left_Variables.h"
            };
        }
      }
    }
}

#endif
