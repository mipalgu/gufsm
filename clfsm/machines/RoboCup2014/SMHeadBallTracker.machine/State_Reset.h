//
// State_Reset.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMHeadBallTracker_State_Reset_h
#define clfsm_SMHeadBallTracker_State_Reset_h

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
            class Reset: public CLState
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
                    Reset(const char *name = "Reset");
                    virtual ~Reset();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Reset_Variables.h"
            };
        }
      }
    }
}

#endif
