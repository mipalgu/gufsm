//
// State_State_4.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMSeeker_State_State_4_h
#define clfsm_SMSeeker_State_State_4_h

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
            class State_4: public CLState
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
                    State_4(const char *name = "State_4");
                    virtual ~State_4();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_State_4_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
