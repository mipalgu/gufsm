//
// State_unloadMachine.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_AddMachineTest_State_unloadMachine_h
#define clfsm_AddMachineTest_State_unloadMachine_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMAddMachineTest
      {
        namespace State
        {
            class unloadMachine: public CLState
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

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    unloadMachine(const char *name = "unloadMachine");
                    virtual ~unloadMachine();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_unloadMachine_Variables.h"
            };
        }
      }
    }
}

#endif
