//
// State_Done_Suspending.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_TestOnSuspend_State_Done_Suspending_h
#define clfsm_TestOnSuspend_State_Done_Suspending_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMTestOnSuspend
      {
        namespace State
        {
            class Done_Suspending: public CLState
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

                class OnSuspend: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wzero-length-array"
                CLTransition *_transitions[0];

                public:
                    Done_Suspending(const char *name = "Done_Suspending");
                    virtual ~Done_Suspending();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Done_Suspending_Variables.h"
#                   include "State_Done_Suspending_Methods.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
