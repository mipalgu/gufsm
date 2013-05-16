//
// State_Back_GetUp.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGetUp_State_Back_GetUp_h
#define clfsm_SMGetUp_State_Back_GetUp_h

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
            class Back_GetUp: public CLState
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
                    Back_GetUp(const char *name = "Back_GetUp");
                    virtual ~Back_GetUp();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Back_GetUp_Variables.h"
            };
        }
      }
    }
}

#endif
