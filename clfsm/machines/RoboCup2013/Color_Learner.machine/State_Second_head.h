//
// State_Second_head.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Color_Learner_State_Second_head_h
#define clfsm_Color_Learner_State_Second_head_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMColor_Learner
      {
        namespace State
        {
            class Second_head: public CLState
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
                    Transition_0(int toState = 5): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Second_head(const char *name = "Second_head");
                    virtual ~Second_head();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Second_head_Variables.h"
            };
        }
      }
    }
}

#endif
