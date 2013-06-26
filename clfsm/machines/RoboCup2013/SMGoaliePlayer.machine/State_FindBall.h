//
// State_FindBall.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGoaliePlayer_State_FindBall_h
#define clfsm_SMGoaliePlayer_State_FindBall_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMGoaliePlayer
      {
        namespace State
        {
            class FindBall: public CLState
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
                    FindBall(const char *name = "FindBall");
                    virtual ~FindBall();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_FindBall_Variables.h"
            };
        }
      }
    }
}

#endif
