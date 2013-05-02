//
// State_LeftWalk1.h -- 2013-05-02 08:32:26 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMWalkScanner_State_LeftWalk1_h
#define clfsm_SMWalkScanner_State_LeftWalk1_h

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
            class LeftWalk1: public CLState
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
                    LeftWalk1(const char *name = "LeftWalk1");
                    virtual ~LeftWalk1();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_LeftWalk1_Variables.h"
            };
        }
      }
    }
}

#endif
