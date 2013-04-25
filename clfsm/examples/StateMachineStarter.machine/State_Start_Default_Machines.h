//
// State_Start_Default_Machines.h -- 2013-04-15 06:32:41 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_StateMachineStarter_State_Start_Default_Machines_h
#define clfsm_StateMachineStarter_State_Start_Default_Machines_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMStateMachineStarter
      {
        namespace State
        {
            class Start_Default_Machines: public CLState
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
                    Transition_0(int toState = 5): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Start_Default_Machines(const char *name = "Start_Default_Machines");
                    virtual ~Start_Default_Machines();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Start_Default_Machines_Variables.h"
            };
        }
      }
    }
}

#endif
