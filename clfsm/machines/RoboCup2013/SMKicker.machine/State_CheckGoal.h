//
// State_CheckGoal.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMKicker_State_CheckGoal_h
#define clfsm_SMKicker_State_CheckGoal_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMKicker
      {
        namespace State
        {
            class CheckGoal: public CLState
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
                    Transition_0(int toState = 12): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 18): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    CheckGoal(const char *name = "CheckGoal");
                    virtual ~CheckGoal();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_CheckGoal_Variables.h"
            };
        }
      }
    }
}

#endif