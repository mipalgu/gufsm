//
// State_WalkConnect.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMKicker3_State_WalkConnect_h
#define clfsm_SMKicker3_State_WalkConnect_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMKicker3
      {
        namespace State
        {
            class WalkConnect: public CLState
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
                    WalkConnect(const char *name = "WalkConnect");
                    virtual ~WalkConnect();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_WalkConnect_Variables.h"
            };
        }
      }
    }
}

#endif
