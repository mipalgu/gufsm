//
// State_StartKneel.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMGoalieSaver_State_StartKneel_h
#define clfsm_SMGoalieSaver_State_StartKneel_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMGoalieSaver
      {
        namespace State
        {
            class StartKneel: public CLState
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
                    Transition_0(int toState = 11): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    StartKneel(const char *name = "StartKneel");
                    virtual ~StartKneel();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_StartKneel_Variables.h"
            };
        }
      }
    }
}

#endif
