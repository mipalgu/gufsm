//
// State_UpdateHead_left.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMHeadGoalTracker_State_UpdateHead_left_h
#define clfsm_SMHeadGoalTracker_State_UpdateHead_left_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMHeadGoalTracker
      {
        namespace State
        {
            class UpdateHead_left: public CLState
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
                    Transition_0(int toState = 6): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    UpdateHead_left(const char *name = "UpdateHead_left");
                    virtual ~UpdateHead_left();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_UpdateHead_left_Variables.h"
            };
        }
      }
    }
}

#endif