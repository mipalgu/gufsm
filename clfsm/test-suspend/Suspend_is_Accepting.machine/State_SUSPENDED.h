//
// State_SUSPENDED.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Suspend_is_Accepting_State_SUSPENDED_h
#define clfsm_Suspend_is_Accepting_State_SUSPENDED_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSuspend_is_Accepting
      {
        namespace State
        {
            class SUSPENDED: public CLState
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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wzero-length-array"
                CLTransition *_transitions[0];

                public:
                    SUSPENDED(const char *name = "SUSPENDED");
                    virtual ~SUSPENDED();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_SUSPENDED_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
