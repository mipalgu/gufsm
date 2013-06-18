//
// State_Head_Scan.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGoalApproach_State_Head_Scan_h
#define clfsm_SMGoalApproach_State_Head_Scan_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMGoalApproach
      {
        namespace State
        {
            class Head_Scan: public CLState
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
                    Head_Scan(const char *name = "Head_Scan");
                    virtual ~Head_Scan();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Head_Scan_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
