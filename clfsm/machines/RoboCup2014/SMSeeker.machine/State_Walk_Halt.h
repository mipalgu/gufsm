//
// State_Walk_Halt.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMSeeker_State_(null)_h
#define clfsm_SMSeeker_State_(null)_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMSeeker
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
                    Transition_0(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    (null)(const char *name = "Walk_Halt");
                    virtual ~(null)();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Walk_Halt_Variables.h"
            };
        }
      }
    }
}

#endif
