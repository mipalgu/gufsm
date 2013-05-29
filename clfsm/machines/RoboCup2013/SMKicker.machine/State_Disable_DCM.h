//
// State_Disable_DCM.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMKicker_State_Disable_DCM_h
#define clfsm_SMKicker_State_Disable_DCM_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMKicker
      {
        namespace State
        {
            class Disable_DCM: public CLState
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
                    Disable_DCM(const char *name = "Disable_DCM");
                    virtual ~Disable_DCM();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Disable_DCM_Variables.h"
            };
        }
      }
    }
}

#endif
