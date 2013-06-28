//
// State_Walk_Halt.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMSeeker_State_Walk_Halt_h
#define clfsm_SMSeeker_State_Walk_Halt_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMSeeker
      {
        namespace State
        {
            class Walk_Halt: public CLState
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
                    Walk_Halt(const char *name = "Walk_Halt");
                    virtual ~Walk_Halt();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Walk_Halt_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
