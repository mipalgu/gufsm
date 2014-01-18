//
// State_LeapWalk.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMLeapController_State_LeapWalk_h
#define clfsm_SMLeapController_State_LeapWalk_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMLeapController
      {
        namespace State
        {
            class LeapWalk: public CLState
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
                    Transition_0(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    LeapWalk(const char *name = "LeapWalk");
                    virtual ~LeapWalk();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_LeapWalk_Variables.h"
            };
        }
      }
    }
}

#endif
