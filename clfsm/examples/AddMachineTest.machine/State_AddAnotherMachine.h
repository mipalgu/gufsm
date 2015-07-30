//
// State_AddAnotherMachine.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_AddMachineTest_State_AddAnotherMachine_h
#define clfsm_AddMachineTest_State_AddAnotherMachine_h

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
            class AddAnotherMachine: public CLState
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
                    AddAnotherMachine(const char *name = "AddAnotherMachine");
                    virtual ~AddAnotherMachine();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_AddAnotherMachine_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
