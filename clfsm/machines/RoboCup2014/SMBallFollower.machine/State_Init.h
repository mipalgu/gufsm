//
// State_Init.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMBallFollower_State_(null)_h
#define clfsm_SMBallFollower_State_(null)_h

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
            class (null): public CLState
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
                    Transition_0(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    (null)(const char *name = "Init");
                    virtual ~(null)();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Init_Variables.h"
            };
        }
      }
    }
}

#endif
