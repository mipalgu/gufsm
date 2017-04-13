//
// State_Error.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Schedule_Suspend_State_Error_h
#define clfsm_Schedule_Suspend_State_Error_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSchedule_Suspend
      {
        namespace State
        {
            class Error: public CLState
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
                    Error(const char *name = "Error");
                    virtual ~Error();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Error_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
