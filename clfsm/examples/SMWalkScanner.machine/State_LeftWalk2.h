//
// State_LeftWalk2.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMWalkScanner_State_LeftWalk2_h
#define clfsm_SMWalkScanner_State_LeftWalk2_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMWalkScanner
      {
        namespace State
        {
            class LeftWalk2: public CLState
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
                    LeftWalk2(const char *name = "LeftWalk2");
                    virtual ~LeftWalk2();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_LeftWalk2_Variables.h"
            };
        }
      }
    }
}

#endif
