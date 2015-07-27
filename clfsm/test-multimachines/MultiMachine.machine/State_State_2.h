//
// State_State_2.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_MultiMachine_State_State_2_h
#define clfsm_MultiMachine_State_State_2_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMMultiMachine
      {
        namespace State
        {
            class State_2: public CLState
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

                CLTransition *_transitions[1];

                public:
                    State_2(const char *name = "State_2");
                    virtual ~State_2();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_State_2_Variables.h"
            };
        }
      }
    }
}

#endif
