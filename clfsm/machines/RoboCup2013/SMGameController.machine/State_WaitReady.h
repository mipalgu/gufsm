//
// State_WaitReady.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGameController_State_WaitReady_h
#define clfsm_SMGameController_State_WaitReady_h

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
            class WaitReady: public CLState
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
                    WaitReady(const char *name = "WaitReady");
                    virtual ~WaitReady();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_WaitReady_Variables.h"
            };
        }
      }
    }
}

#endif
