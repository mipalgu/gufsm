//
// State_Restart_FSMs.h -- 2013-04-12 03:22:15 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_State_Restart_FSMs_h
#define clfsm_State_Restart_FSMs_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
        namespace State
        {
            class Restart_FSMs: public CLState
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
                    Restart_FSMs(const char *name = "Restart_FSMs");
                    virtual ~Restart_FSMs();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Restart_FSMs_Variables.h"
            };
        }
    }
}

#endif
