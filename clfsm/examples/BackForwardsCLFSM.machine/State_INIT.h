//
// State_INIT.h -- 2013-01-23 06:03:42 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_State_INIT_h
#define clfsm_State_INIT_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
        namespace State
        {
            class INIT: public CLState
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
                    INIT(const char *name = "INIT");
                    virtual ~INIT();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_INIT_Variables.h"
            };
        }
    }
}

#endif
