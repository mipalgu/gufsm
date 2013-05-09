//
// State_Turn_Right.h -- 2013-05-09 04:48:07 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMBallFollower_State_Turn_Right_h
#define clfsm_SMBallFollower_State_Turn_Right_h

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
            class Turn_Right: public CLState
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
                    Turn_Right(const char *name = "Turn_Right");
                    virtual ~Turn_Right();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Turn_Right_Variables.h"
            };
        }
      }
    }
}

#endif
