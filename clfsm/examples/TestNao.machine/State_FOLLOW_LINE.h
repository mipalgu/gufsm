//
// State_FOLLOW_LINE.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_TestNao_State_FOLLOW_LINE_h
#define clfsm_TestNao_State_FOLLOW_LINE_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMTestNao
      {
        namespace State
        {
            class FOLLOW_LINE: public CLState
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
                    Transition_0(int toState = 0): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    FOLLOW_LINE(const char *name = "FOLLOW_LINE");
                    virtual ~FOLLOW_LINE();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_FOLLOW_LINE_Variables.h"
            };
        }
      }
    }
}

#endif
