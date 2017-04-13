//
// State_StatesActions.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_CLReflectDemo_State_StatesActions_h
#define clfsm_CLReflectDemo_State_StatesActions_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMCLReflectDemo
      {
        namespace State
        {
            class StatesActions: public CLState
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

                CLTransition *_transitions[1];

                public:
                    StatesActions(const char *name = "StatesActions");
                    virtual ~StatesActions();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_StatesActions_Variables.h"
            };
        }
      }
    }
}

#endif
