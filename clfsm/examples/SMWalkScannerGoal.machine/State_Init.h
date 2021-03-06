//
// State_Init.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMWalkScannerGoal_State_Init_h
#define clfsm_SMWalkScannerGoal_State_Init_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMWalkScannerGoal
      {
        namespace State
        {
            class Init: public CLState
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
                    Init(const char *name = "Init");
                    virtual ~Init();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Init_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
