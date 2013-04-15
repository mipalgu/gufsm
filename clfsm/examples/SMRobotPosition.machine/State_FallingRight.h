//
// State_FallingRight.h -- 2013-04-15 06:10:09 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMRobotPosition_State_FallingRight_h
#define clfsm_SMRobotPosition_State_FallingRight_h

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
            class FallingRight: public CLState
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
                    FallingRight(const char *name = "FallingRight");
                    virtual ~FallingRight();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_FallingRight_Variables.h"
            };
        }
      }
    }
}

#endif
