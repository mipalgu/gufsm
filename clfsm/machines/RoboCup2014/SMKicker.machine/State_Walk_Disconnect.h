//
// State_Walk_Disconnect.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMKicker_State_Walk_Disconnect_h
#define clfsm_SMKicker_State_Walk_Disconnect_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMKicker
      {
        namespace State
        {
            class Walk_Disconnect: public CLState
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
                    Transition_0(int toState = 13): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 8): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    Walk_Disconnect(const char *name = "Walk_Disconnect");
                    virtual ~Walk_Disconnect();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_Walk_Disconnect_Variables.h"
            };
        }
      }
    }
}

#endif
