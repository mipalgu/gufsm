//
// State_CalcRight.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SLAM_State_CalcRight_h
#define clfsm_SLAM_State_CalcRight_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSLAM
      {
        namespace State
        {
            class CalcRight: public CLState
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
                    Transition_0(int toState = 13): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 15): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    CalcRight(const char *name = "CalcRight");
                    virtual ~CalcRight();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_CalcRight_Variables.h"
#                   include "State_CalcRight_Methods.h"
            };
        }
      }
    }
}

#endif
