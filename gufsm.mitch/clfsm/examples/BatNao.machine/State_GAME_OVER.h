//
// State_GAME_OVER.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_BatNao_State_GAME_OVER_h
#define clfsm_BatNao_State_GAME_OVER_h

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
            class GAME_OVER: public CLState
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
                    GAME_OVER(const char *name = "GAME_OVER");
                    virtual ~GAME_OVER();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_GAME_OVER_Variables.h"
            };
        }
      }
    }
}

#endif
