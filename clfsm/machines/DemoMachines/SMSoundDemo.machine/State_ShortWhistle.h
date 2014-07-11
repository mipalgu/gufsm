//
// State_ShortWhistle.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMSoundDemo_State_ShortWhistle_h
#define clfsm_SMSoundDemo_State_ShortWhistle_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMSoundDemo
      {
        namespace State
        {
            class ShortWhistle: public CLState
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
                    Transition_0(int toState = 7): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    ShortWhistle(const char *name = "ShortWhistle");
                    virtual ~ShortWhistle();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_ShortWhistle_Variables.h"
            };
        }
      }
    }
}

#endif
