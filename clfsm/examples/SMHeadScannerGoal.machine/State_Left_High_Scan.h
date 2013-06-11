//
// State_Left_High_Scan.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMHeadScannerGoal_State_Left_High_Scan_h
#define clfsm_SMHeadScannerGoal_State_Left_High_Scan_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMHeadScannerGoal
      {
        namespace State
        {
            class Left_High_Scan: public CLState
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
                    Left_High_Scan(const char *name = "Left_High_Scan");
                    virtual ~Left_High_Scan();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Left_High_Scan_Variables.h"
            };
        }
      }
    }
}

#endif
