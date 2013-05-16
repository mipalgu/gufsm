//
// State_Zero.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMButtonRightFoot_State_Zero_h
#define clfsm_SMButtonRightFoot_State_Zero_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMButtonRightFoot
      {
        namespace State
        {
            class Zero: public CLState
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
                    Zero(const char *name = "Zero");
                    virtual ~Zero();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Zero_Variables.h"
            };
        }
      }
    }
}

#endif
