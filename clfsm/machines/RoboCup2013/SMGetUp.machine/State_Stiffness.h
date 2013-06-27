//
// State_Stiffness.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGetUp_State_Stiffness_h
#define clfsm_SMGetUp_State_Stiffness_h

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
            class Stiffness: public CLState
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
                    Transition_0(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Stiffness(const char *name = "Stiffness");
                    virtual ~Stiffness();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Stiffness_Variables.h"
            };
        }
      }
    }
}

#endif
