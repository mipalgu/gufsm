//
// State_SeekBall.h -- 2013-05-01 05:11:18 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMPlayer_State_SeekBall_h
#define clfsm_SMPlayer_State_SeekBall_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMPlayer
      {
        namespace State
        {
            class SeekBall: public CLState
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
                    SeekBall(const char *name = "SeekBall");
                    virtual ~SeekBall();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_SeekBall_Variables.h"
            };
        }
      }
    }
}

#endif
