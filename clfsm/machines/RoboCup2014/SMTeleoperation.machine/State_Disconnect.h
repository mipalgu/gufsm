//
// State_Disconnect.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMTeleoperation_State_Disconnect_h
#define clfsm_SMTeleoperation_State_Disconnect_h

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
            class Disconnect: public CLState
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
                    Disconnect(const char *name = "Disconnect");
                    virtual ~Disconnect();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Disconnect_Variables.h"
            };
        }
      }
    }
}

#endif
