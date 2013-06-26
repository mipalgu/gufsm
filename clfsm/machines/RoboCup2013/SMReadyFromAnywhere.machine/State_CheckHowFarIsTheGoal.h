//
// State_CheckHowFarIsTheGoal.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMReadyFromAnywhere_State_CheckHowFarIsTheGoal_h
#define clfsm_SMReadyFromAnywhere_State_CheckHowFarIsTheGoal_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMReadyFromAnywhere
      {
        namespace State
        {
            class CheckHowFarIsTheGoal: public CLState
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

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 13): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    CheckHowFarIsTheGoal(const char *name = "CheckHowFarIsTheGoal");
                    virtual ~CheckHowFarIsTheGoal();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_CheckHowFarIsTheGoal_Variables.h"
            };
        }
      }
    }
}

#endif
