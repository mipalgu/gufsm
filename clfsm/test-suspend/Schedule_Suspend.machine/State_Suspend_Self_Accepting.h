//
// State_Suspend_Self_Accepting.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Schedule_Suspend_State_Suspend_Self_Accepting_h
#define clfsm_Schedule_Suspend_State_Suspend_Self_Accepting_h

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
            class Suspend_Self_Accepting: public CLState
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
                    Suspend_Self_Accepting(const char *name = "Suspend_Self_Accepting");
                    virtual ~Suspend_Self_Accepting();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Suspend_Self_Accepting_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
