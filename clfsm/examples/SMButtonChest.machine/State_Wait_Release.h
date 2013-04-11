//
// State_Wait_Release.h -- 2013-04-11 02:52:48 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_State_Wait_Release_h
#define clfsm_State_Wait_Release_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
        namespace State
        {
            class Wait_Release: public CLState
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
                    Wait_Release(const char *name = "Wait_Release");
                    virtual ~Wait_Release();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Wait_Release_Variables.h"
            };
        }
    }
}

#endif
