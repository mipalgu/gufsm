//
// State_FallingLeft.h -- 2013-05-09 04:51:47 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMRobotPosition_State_FallingLeft_h
#define clfsm_SMRobotPosition_State_FallingLeft_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMRobotPosition
      {
        namespace State
        {
            class FallingLeft: public CLState
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
                    FallingLeft(const char *name = "FallingLeft");
                    virtual ~FallingLeft();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_FallingLeft_Variables.h"
            };
        }
      }
    }
}

#endif
