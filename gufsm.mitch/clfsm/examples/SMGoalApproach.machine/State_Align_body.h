//
// State_Align_body.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGoalApproach_State_Align_body_h
#define clfsm_SMGoalApproach_State_Align_body_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMGoalApproach
      {
        namespace State
        {
            class Align_body: public CLState
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
                    Align_body(const char *name = "Align_body");
                    virtual ~Align_body();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Align_body_Variables.h"
            };
        }
      }
    }
}

#endif
