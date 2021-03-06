//
// State_Delay.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_RobotPosition_State_Delay_h
#define clfsm_RobotPosition_State_Delay_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMRobotPosition
      {
        namespace State
        {
            class Delay: public CLState
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
                    Transition_0(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Delay(const char *name = "Delay");
                    virtual ~Delay();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Delay_Variables.h"
            };
        }
      }
    }
}

#endif
