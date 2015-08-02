//
// State_Do_Nothing.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Suspend_Resume_Restart_State_Do_Nothing_h
#define clfsm_Suspend_Resume_Restart_State_Do_Nothing_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSuspend_Resume_Restart
      {
        namespace State
        {
            class Do_Nothing: public CLState
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

                class Transition_0: public CLTransition
                {
                public:
                    Transition_0(int toState = 7): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Do_Nothing(const char *name = "Do_Nothing");
                    virtual ~Do_Nothing();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Do_Nothing_Variables.h"
            };
        }
      }
    }
}

#endif
