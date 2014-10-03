//
// State_FINISH_FALLING.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_FallManager_State_FINISH_FALLING_h
#define clfsm_FallManager_State_FINISH_FALLING_h

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
            class FINISH_FALLING: public CLState
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
                    FINISH_FALLING(const char *name = "FINISH_FALLING");
                    virtual ~FINISH_FALLING();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_FINISH_FALLING_Variables.h"
            };
        }
      }
    }
}

#endif
