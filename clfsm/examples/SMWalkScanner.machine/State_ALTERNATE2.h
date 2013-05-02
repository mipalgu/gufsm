//
// State_ALTERNATE2.h -- 2013-05-02 08:32:26 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMWalkScanner_State_ALTERNATE2_h
#define clfsm_SMWalkScanner_State_ALTERNATE2_h

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
            class ALTERNATE2: public CLState
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
                    Transition_0(int toState = 10): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 9): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    ALTERNATE2(const char *name = "ALTERNATE2");
                    virtual ~ALTERNATE2();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_ALTERNATE2_Variables.h"
            };
        }
      }
    }
}

#endif
