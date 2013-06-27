//
// State_State_18.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGoalieSaver_State_State_18_h
#define clfsm_SMGoalieSaver_State_State_18_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMGoalieSaver
      {
        namespace State
        {
            class State_18: public CLState
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
                    State_18(const char *name = "State_18");
                    virtual ~State_18();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_State_18_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
