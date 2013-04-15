//
// State_Forward.h -- 2013-04-15 04:09:28 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMRobotPosition_State_Forward_h
#define clfsm_SMRobotPosition_State_Forward_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMRobotPosition
      {
        namespace State
        {
            class Forward: public CLState
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
                    Transition_0(int toState = 7): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Forward(const char *name = "Forward");
                    virtual ~Forward();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Forward_Variables.h"
            };
        }
      }
    }
}

#endif
