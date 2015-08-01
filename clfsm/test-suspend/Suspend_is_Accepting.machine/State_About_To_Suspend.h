//
// State_About_To_Suspend.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Suspend_is_Accepting_State_About_To_Suspend_h
#define clfsm_Suspend_is_Accepting_State_About_To_Suspend_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSuspend_is_Accepting
      {
        namespace State
        {
            class About_To_Suspend: public CLState
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
                    Transition_0(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 4): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    About_To_Suspend(const char *name = "About_To_Suspend");
                    virtual ~About_To_Suspend();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_About_To_Suspend_Variables.h"
            };
        }
      }
    }
}

#endif
