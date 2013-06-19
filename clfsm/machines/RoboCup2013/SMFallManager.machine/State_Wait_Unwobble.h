//
// State_Wait_Unwobble.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMFallManager_State_Wait_Unwobble_h
#define clfsm_SMFallManager_State_Wait_Unwobble_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMFallManager
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
                    Transition_0(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Wait_Unwobble(const char *name = "Wait_Unwobble");
                    virtual ~Wait_Unwobble();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Wait_Unwobble_Variables.h"
            };
        }
      }
    }
}

#endif
