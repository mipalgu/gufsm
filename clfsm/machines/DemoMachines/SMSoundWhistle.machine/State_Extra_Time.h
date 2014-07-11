//
// State_Extra_Time.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMSoundWhistle_State_Extra_Time_h
#define clfsm_SMSoundWhistle_State_Extra_Time_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMSoundWhistle
      {
        namespace State
        {
            class Extra_Time: public CLState
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
                    Extra_Time(const char *name = "Extra_Time");
                    virtual ~Extra_Time();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Extra_Time_Variables.h"
            };
        }
      }
    }
}

#endif
