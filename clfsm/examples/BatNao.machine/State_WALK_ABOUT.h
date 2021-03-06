//
// State_WALK_ABOUT.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_BatNao_State_WALK_ABOUT_h
#define clfsm_BatNao_State_WALK_ABOUT_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMBatNao
      {
        namespace State
        {
            class WALK_ABOUT: public CLState
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
                    WALK_ABOUT(const char *name = "WALK_ABOUT");
                    virtual ~WALK_ABOUT();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_WALK_ABOUT_Variables.h"
            };
        }
      }
    }
}

#endif
