//
// State_Quiet.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMSoundStartStop_State_Quiet_h
#define clfsm_SMSoundStartStop_State_Quiet_h

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
            class Quiet: public CLState
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
                    Transition_0(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 2): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_2: public CLTransition
                {
                public:
                    Transition_2(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[3];

                public:
                    Quiet(const char *name = "Quiet");
                    virtual ~Quiet();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 3; }

#                   include "State_Quiet_Variables.h"
            };
        }
      }
    }
}

#endif
