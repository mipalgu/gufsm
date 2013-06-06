//
// State_Update_Head.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMHeadGoalTracker_State_Update_Head_h
#define clfsm_SMHeadGoalTracker_State_Update_Head_h

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
            class Update_Head: public CLState
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
                    Update_Head(const char *name = "Update_Head");
                    virtual ~Update_Head();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Update_Head_Variables.h"
            };
        }
      }
    }
}

#endif
