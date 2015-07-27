//
// State_State_3.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_MultiMachine_State_State_3_h
#define clfsm_MultiMachine_State_State_3_h

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
            class State_3: public CLState
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
                    State_3(const char *name = "State_3");
                    virtual ~State_3();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_State_3_Variables.h"
            };
        }
      }
    }
}

#endif
