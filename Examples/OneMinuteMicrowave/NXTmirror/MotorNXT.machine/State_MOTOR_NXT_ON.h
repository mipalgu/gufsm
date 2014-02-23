//
// State_MOTOR_NXT_ON.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_MotorNXT_State_MOTOR_NXT_ON_h
#define clfsm_MotorNXT_State_MOTOR_NXT_ON_h

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
            class MOTOR_NXT_ON: public CLState
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
                    MOTOR_NXT_ON(const char *name = "MOTOR_NXT_ON");
                    virtual ~MOTOR_NXT_ON();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_MOTOR_NXT_ON_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
