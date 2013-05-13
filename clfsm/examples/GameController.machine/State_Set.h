//
// State_Set.h -- 2013-05-13 03:32:49 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_GameController_State_Set_h
#define clfsm_GameController_State_Set_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMGameController
      {
        namespace State
        {
            class Set: public CLState
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
                    Set(const char *name = "Set");
                    virtual ~Set();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Set_Variables.h"
            };
        }
      }
    }
}

#endif
