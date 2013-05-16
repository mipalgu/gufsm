//
// State_Short_Straight.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMBallFollower_State_Short_Straight_h
#define clfsm_SMBallFollower_State_Short_Straight_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMBallFollower
      {
        namespace State
        {
            class Short_Straight: public CLState
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
                    Short_Straight(const char *name = "Short_Straight");
                    virtual ~Short_Straight();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Short_Straight_Variables.h"
            };
        }
      }
    }
}

#endif
