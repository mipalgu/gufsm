//
// State_Pong.h -- 2013-04-15 04:27:05 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_TestPingPongWithWBBoolean_State_Pong_h
#define clfsm_TestPingPongWithWBBoolean_State_Pong_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMTestPingPongWithWBBoolean
      {
        namespace State
        {
            class Pong: public CLState
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
                    Pong(const char *name = "Pong");
                    virtual ~Pong();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Pong_Variables.h"
            };
        }
      }
    }
}

#endif
