//
// State_Right_Low_Scan.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMHeadScannerGoal_State_Right_Low_Scan_h
#define clfsm_SMHeadScannerGoal_State_Right_Low_Scan_h

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
            class Right_Low_Scan: public CLState
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
                    Transition_0(int toState = 2): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Right_Low_Scan(const char *name = "Right_Low_Scan");
                    virtual ~Right_Low_Scan();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Right_Low_Scan_Variables.h"
            };
        }
      }
    }
}

#endif
