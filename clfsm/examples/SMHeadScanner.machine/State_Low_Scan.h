//
// State_Low_Scan.h -- 2013-04-26 03:55:22 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMHeadScanner_State_Low_Scan_h
#define clfsm_SMHeadScanner_State_Low_Scan_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMHeadScanner
      {
        namespace State
        {
            class Low_Scan: public CLState
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
                    Transition_0(int toState = 8): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Low_Scan(const char *name = "Low_Scan");
                    virtual ~Low_Scan();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Low_Scan_Variables.h"
            };
        }
      }
    }
}

#endif
