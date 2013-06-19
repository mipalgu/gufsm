//
// State_Calc_BallAngle.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMBallFollower_State_Calc_BallAngle_h
#define clfsm_SMBallFollower_State_Calc_BallAngle_h

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
            class Calc_BallAngle: public CLState
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

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 6): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    Calc_BallAngle(const char *name = "Calc_BallAngle");
                    virtual ~Calc_BallAngle();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_Calc_BallAngle_Variables.h"
            };
        }
      }
    }
}

#endif
