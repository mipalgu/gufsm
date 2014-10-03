//
// State_INITAIL.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_FallManager_State_INITAIL_h
#define clfsm_FallManager_State_INITAIL_h

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
            class INITAIL: public CLState
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
                    INITAIL(const char *name = "INITAIL");
                    virtual ~INITAIL();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_INITAIL_Variables.h"
            };
        }
      }
    }
}

#endif
