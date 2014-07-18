//
// State_Shutdown.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMShutdown_State_Shutdown_h
#define clfsm_SMShutdown_State_Shutdown_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMShutdown
      {
        namespace State
        {
            class Shutdown: public CLState
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
                    Transition_0(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Shutdown(const char *name = "Shutdown");
                    virtual ~Shutdown();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Shutdown_Variables.h"
            };
        }
      }
    }
}

#endif
