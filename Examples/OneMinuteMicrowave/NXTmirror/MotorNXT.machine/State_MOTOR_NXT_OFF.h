//
// State_MOTOR_NXT_OFF.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_MotorNXT_State_MOTOR_NXT_OFF_h
#define clfsm_MotorNXT_State_MOTOR_NXT_OFF_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMMotorNXT
      {
        namespace State
        {
            class MOTOR_NXT_OFF: public CLState
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
                    MOTOR_NXT_OFF(const char *name = "MOTOR_NXT_OFF");
                    virtual ~MOTOR_NXT_OFF();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_MOTOR_NXT_OFF_Variables.h"
            };
        }
      }
    }
}

#endif
