//
// State_PenalisedStance.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGameController_State_PenalisedStance_h
#define clfsm_SMGameController_State_PenalisedStance_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMGameController
      {
        namespace State
        {
            class PenalisedStance: public CLState
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

                CLTransition *_transitions[1];

                public:
                    PenalisedStance(const char *name = "PenalisedStance");
                    virtual ~PenalisedStance();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_PenalisedStance_Variables.h"
            };
        }
      }
    }
}

#endif
