//
// State_KickRight.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMKicker_State_KickRight_h
#define clfsm_SMKicker_State_KickRight_h

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
            class KickRight: public CLState
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
                    KickRight(const char *name = "KickRight");
                    virtual ~KickRight();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_KickRight_Variables.h"
            };
        }
      }
    }
}

#endif
