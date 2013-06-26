//
// State_OurHalfFacingUp.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMReadyFromAnywhere_State_OurHalfFacingUp_h
#define clfsm_SMReadyFromAnywhere_State_OurHalfFacingUp_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMReadyFromAnywhere
      {
        namespace State
        {
            class OurHalfFacingUp: public CLState
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
                    OurHalfFacingUp(const char *name = "OurHalfFacingUp");
                    virtual ~OurHalfFacingUp();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_OurHalfFacingUp_Variables.h"
            };
        }
      }
    }
}

#endif
