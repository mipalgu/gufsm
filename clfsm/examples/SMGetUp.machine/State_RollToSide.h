//
// State_RollToSide.h -- 2013-04-18 04:16:13 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGetUp_State_RollToSide_h
#define clfsm_SMGetUp_State_RollToSide_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMGetUp
      {
        namespace State
        {
            class RollToSide: public CLState
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
                    RollToSide(const char *name = "RollToSide");
                    virtual ~RollToSide();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_RollToSide_Variables.h"
            };
        }
      }
    }
}

#endif
