//
// State_LIGHT_NXT_OFF.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_LightNXT_State_LIGHT_NXT_OFF_h
#define clfsm_LightNXT_State_LIGHT_NXT_OFF_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMLightNXT
      {
        namespace State
        {
            class LIGHT_NXT_OFF: public CLState
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
                    LIGHT_NXT_OFF(const char *name = "LIGHT_NXT_OFF");
                    virtual ~LIGHT_NXT_OFF();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_LIGHT_NXT_OFF_Variables.h"
            };
        }
      }
    }
}

#endif
