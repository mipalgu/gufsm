//
// State_AddMachine.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_AddMachineTest_State_AddMachine_h
#define clfsm_AddMachineTest_State_AddMachine_h

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
            class AddMachine: public CLState
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
                    AddMachine(const char *name = "AddMachine");
                    virtual ~AddMachine();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_AddMachine_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
