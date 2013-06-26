//
// State_Restart_GoalTrackerMachine.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMPlayer_State_Restart_GoalTrackerMachine_h
#define clfsm_SMPlayer_State_Restart_GoalTrackerMachine_h

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
            class Restart_GoalTrackerMachine: public CLState
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
                    Restart_GoalTrackerMachine(const char *name = "Restart_GoalTrackerMachine");
                    virtual ~Restart_GoalTrackerMachine();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Restart_GoalTrackerMachine_Variables.h"
            };
        }
      }
    }
}

#endif
