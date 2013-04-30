//
// State_Loop.h -- 2013-04-30 09:21:56 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMHeadBallTracker_State_Loop_h
#define clfsm_SMHeadBallTracker_State_Loop_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMHeadBallTracker
      {
        namespace State
        {
            class Loop: public CLState
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
                    Loop(const char *name = "Loop");
                    virtual ~Loop();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Loop_Variables.h"
            };
        }
      }
    }
}

#endif
