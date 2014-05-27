//
// State_Stop.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMTeleoperation_State_Stop_h
#define clfsm_SMTeleoperation_State_Stop_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMTeleoperation
      {
        namespace State
        {
            class Stop: public CLState
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
                    Transition_0(int toState = 7): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Stop(const char *name = "Stop");
                    virtual ~Stop();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Stop_Variables.h"
            };
        }
      }
    }
}

#endif
