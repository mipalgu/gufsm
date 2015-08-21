//
// State_Suspend_All.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Schedule_Suspend_State_Suspend_All_h
#define clfsm_Schedule_Suspend_State_Suspend_All_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSchedule_Suspend
      {
        namespace State
        {
            class Suspend_All: public CLState
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
                    Suspend_All(const char *name = "Suspend_All");
                    virtual ~Suspend_All();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Suspend_All_Variables.h"
            };
        }
      }
    }
}

#endif
