//
// State_Initial.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMSoundDemo_State_Initial_h
#define clfsm_SMSoundDemo_State_Initial_h

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
            class Initial: public CLState
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

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 6): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    Initial(const char *name = "Initial");
                    virtual ~Initial();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_Initial_Variables.h"
            };
        }
      }
    }
}

#endif
