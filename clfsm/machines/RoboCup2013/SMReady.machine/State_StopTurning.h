//
// State_StopTurning.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMReady_State_StopTurning_h
#define clfsm_SMReady_State_StopTurning_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMReady
      {
        namespace State
        {
            class StopTurning: public CLState
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
                    StopTurning(const char *name = "StopTurning");
                    virtual ~StopTurning();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_StopTurning_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
