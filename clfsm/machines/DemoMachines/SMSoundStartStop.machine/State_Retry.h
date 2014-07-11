//
// State_Retry.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMSoundStartStop_State_Retry_h
#define clfsm_SMSoundStartStop_State_Retry_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMSoundStartStop
      {
        namespace State
        {
            class Retry: public CLState
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
                    Retry(const char *name = "Retry");
                    virtual ~Retry();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Retry_Variables.h"
            };
        }
      }
    }
}

#endif
