//
// State_Wait_State.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Safety_BatteryMonitor_State_Wait_State_h
#define clfsm_Safety_BatteryMonitor_State_Wait_State_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSafety_BatteryMonitor
      {
        namespace State
        {
            class Wait_State: public CLState
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
                    Wait_State(const char *name = "Wait_State");
                    virtual ~Wait_State();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Wait_State_Variables.h"
            };
        }
      }
    }
}

#endif
