//
// State_START_SONAR.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_BatNaoMoves_State_START_SONAR_h
#define clfsm_BatNaoMoves_State_START_SONAR_h

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
            class START_SONAR: public CLState
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

                CLTransition *_transitions[1];

                public:
                    START_SONAR(const char *name = "START_SONAR");
                    virtual ~START_SONAR();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_START_SONAR_Variables.h"
            };
        }
      }
    }
}

#endif
