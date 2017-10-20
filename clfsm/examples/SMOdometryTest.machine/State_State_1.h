//
// State_State_1.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SMOdometryTest_State_State_1_h
#define clfsm_SMOdometryTest_State_State_1_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMOdometryTest
      {
        namespace State
        {
            class State_1: public CLState
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
#pragma clang diagnostic pop


                public:
                    State_1(const char *name = "State_1");
                    virtual ~State_1();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_State_1_Variables.h"
#                   include "State_State_1_Methods.h"
            };
        }
      }
    }
}

#endif
