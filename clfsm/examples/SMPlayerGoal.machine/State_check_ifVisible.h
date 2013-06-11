//
// State_check_ifVisible.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMPlayerGoal_State_check_ifVisible_h
#define clfsm_SMPlayerGoal_State_check_ifVisible_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMPlayerGoal
      {
        namespace State
        {
            class check_ifVisible: public CLState
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
                    Transition_0(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 2): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    check_ifVisible(const char *name = "check_ifVisible");
                    virtual ~check_ifVisible();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_check_ifVisible_Variables.h"
            };
        }
      }
    }
}

#endif
