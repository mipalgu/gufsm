//
// State_State_2.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SpeedTest_State_State_2_h
#define clfsm_SpeedTest_State_State_2_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSpeedTest
      {
        namespace State
        {
            class State_2: public CLState
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
                    State_2(const char *name = "State_2");
                    virtual ~State_2();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_State_2_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
