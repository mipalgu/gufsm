//
// State_Wait_Unpenalise.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGameController_State_Wait_Unpenalise_h
#define clfsm_SMGameController_State_Wait_Unpenalise_h

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
            class Wait_Unpenalise: public CLState
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

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 9): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    Wait_Unpenalise(const char *name = "Wait_Unpenalise");
                    virtual ~Wait_Unpenalise();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_Wait_Unpenalise_Variables.h"
            };
        }
      }
    }
}

#endif
