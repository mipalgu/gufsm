//
// State_OK.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Schedule_Suspend_State_OK_h
#define clfsm_Schedule_Suspend_State_OK_h

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
            class OK: public CLState
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
                    OK(const char *name = "OK");
                    virtual ~OK();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_OK_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
