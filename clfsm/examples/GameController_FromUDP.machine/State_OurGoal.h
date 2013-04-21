//
// State_OurGoal.h -- 2013-04-21 23:42:51 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_GameController_FromUDP_State_OurGoal_h
#define clfsm_GameController_FromUDP_State_OurGoal_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMGameController_FromUDP
      {
        namespace State
        {
            class OurGoal: public CLState
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
                    OurGoal(const char *name = "OurGoal");
                    virtual ~OurGoal();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_OurGoal_Variables.h"
            };
        }
      }
    }
}

#endif
