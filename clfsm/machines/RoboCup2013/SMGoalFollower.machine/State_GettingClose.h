//
// State_GettingClose.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGoalFollower_State_GettingClose_h
#define clfsm_SMGoalFollower_State_GettingClose_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMGoalFollower
      {
        namespace State
        {
            class GettingClose: public CLState
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
                    GettingClose(const char *name = "GettingClose");
                    virtual ~GettingClose();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_GettingClose_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
