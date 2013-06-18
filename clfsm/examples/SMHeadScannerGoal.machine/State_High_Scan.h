//
// State_High_Scan.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMHeadScannerGoal_State_High_Scan_h
#define clfsm_SMHeadScannerGoal_State_High_Scan_h

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
            class High_Scan: public CLState
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
                    Transition_0(int toState = 4): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    High_Scan(const char *name = "High_Scan");
                    virtual ~High_Scan();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_High_Scan_Variables.h"
            };
        }
      }
    }
}

#endif
