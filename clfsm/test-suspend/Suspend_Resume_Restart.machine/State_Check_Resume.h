//
// State_Check_Resume.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Suspend_Resume_Restart_State_Check_Resume_h
#define clfsm_Suspend_Resume_Restart_State_Check_Resume_h

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
            class Check_Resume: public CLState
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
                    Transition_0(int toState = 4): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 6): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    Check_Resume(const char *name = "Check_Resume");
                    virtual ~Check_Resume();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_Check_Resume_Variables.h"
            };
        }
      }
    }
}

#endif
