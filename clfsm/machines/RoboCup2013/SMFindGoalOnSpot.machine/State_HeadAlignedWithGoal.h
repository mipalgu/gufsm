//
// State_HeadAlignedWithGoal.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMFindGoalOnSpot_State_HeadAlignedWithGoal_h
#define clfsm_SMFindGoalOnSpot_State_HeadAlignedWithGoal_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMFindGoalOnSpot
      {
        namespace State
        {
            class HeadAlignedWithGoal: public CLState
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

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    HeadAlignedWithGoal(const char *name = "HeadAlignedWithGoal");
                    virtual ~HeadAlignedWithGoal();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_HeadAlignedWithGoal_Variables.h"
            };
        }
      }
    }
}

#endif
