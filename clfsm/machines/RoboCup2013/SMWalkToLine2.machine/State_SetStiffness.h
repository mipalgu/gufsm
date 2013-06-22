//
// State_SetStiffness.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMWalkToLine2_State_SetStiffness_h
#define clfsm_SMWalkToLine2_State_SetStiffness_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMWalkToLine2
      {
        namespace State
        {
            class SetStiffness: public CLState
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

                CLTransition *_transitions[1];

                public:
                    SetStiffness(const char *name = "SetStiffness");
                    virtual ~SetStiffness();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_SetStiffness_Variables.h"
            };
        }
      }
    }
}

#endif
