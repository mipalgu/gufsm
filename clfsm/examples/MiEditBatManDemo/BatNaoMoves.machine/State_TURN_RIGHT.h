//
// State_TURN_RIGHT.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_BatNaoMoves_State_TURN_RIGHT_h
#define clfsm_BatNaoMoves_State_TURN_RIGHT_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMBatNaoMoves
      {
        namespace State
        {
            class TURN_RIGHT: public CLState
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
                    Transition_0(int toState = 2): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    TURN_RIGHT(const char *name = "TURN_RIGHT");
                    virtual ~TURN_RIGHT();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_TURN_RIGHT_Variables.h"
            };
        }
      }
    }
}

#endif
