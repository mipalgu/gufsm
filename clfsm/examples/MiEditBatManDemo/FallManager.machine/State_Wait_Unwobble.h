//
// State_Wait_Unwobble.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_FallManager_State_Wait_Unwobble_h
#define clfsm_FallManager_State_Wait_Unwobble_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMFallManager
      {
        namespace State
        {
            class Wait_Unwobble: public CLState
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

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 5): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    Wait_Unwobble(const char *name = "Wait_Unwobble");
                    virtual ~Wait_Unwobble();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_Wait_Unwobble_Variables.h"
            };
        }
      }
    }
}

#endif
