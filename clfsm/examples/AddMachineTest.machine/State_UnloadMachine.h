//
// State_UnloadMachine.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_AddMachineTest_State_UnloadMachine_h
#define clfsm_AddMachineTest_State_UnloadMachine_h

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
            class UnloadMachine: public CLState
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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wzero-length-array"
                CLTransition *_transitions[0];

                public:
                    UnloadMachine(const char *name = "UnloadMachine");
                    virtual ~UnloadMachine();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_UnloadMachine_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
