//
// State_BAT_MAN_BEHAVIOR.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_BatManController_State_BAT_MAN_BEHAVIOR_h
#define clfsm_BatManController_State_BAT_MAN_BEHAVIOR_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMBatManController
      {
        namespace State
        {
            class BAT_MAN_BEHAVIOR: public CLState
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

                CLTransition *_transitions[1];

                public:
                    BAT_MAN_BEHAVIOR(const char *name = "BAT_MAN_BEHAVIOR");
                    virtual ~BAT_MAN_BEHAVIOR();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_BAT_MAN_BEHAVIOR_Variables.h"
            };
        }
      }
    }
}

#endif
