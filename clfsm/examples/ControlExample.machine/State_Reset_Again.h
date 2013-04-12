//
// State_Reset_Again.h -- 2013-04-12 00:14:38 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_State_Reset_Again_h
#define clfsm_State_Reset_Again_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
        namespace State
        {
            class Reset_Again: public CLState
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
                    Reset_Again(const char *name = "Reset_Again");
                    virtual ~Reset_Again();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Reset_Again_Variables.h"
            };
        }
    }
}

#endif
