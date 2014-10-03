//
// State_BUTTON_RELEASED.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_buttonNXT_State_BUTTON_RELEASED_h
#define clfsm_buttonNXT_State_BUTTON_RELEASED_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMbuttonNXT
      {
        namespace State
        {
            class BUTTON_RELEASED: public CLState
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
                    BUTTON_RELEASED(const char *name = "BUTTON_RELEASED");
                    virtual ~BUTTON_RELEASED();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_BUTTON_RELEASED_Variables.h"
            };
        }
      }
    }
}

#endif
