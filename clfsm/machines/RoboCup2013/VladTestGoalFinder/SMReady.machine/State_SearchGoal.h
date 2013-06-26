//
// State_SearchGoal.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMReady_State_SearchGoal_h
#define clfsm_SMReady_State_SearchGoal_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMReady
      {
        namespace State
        {
            class SearchGoal: public CLState
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
                    Transition_0(int toState = 12): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    SearchGoal(const char *name = "SearchGoal");
                    virtual ~SearchGoal();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_SearchGoal_Variables.h"
            };
        }
      }
    }
}

#endif