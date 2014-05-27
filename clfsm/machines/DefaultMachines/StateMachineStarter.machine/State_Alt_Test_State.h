//
// State_Alt_Test_State.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_StateMachineStarter_State_Alt_Test_State_h
#define clfsm_StateMachineStarter_State_Alt_Test_State_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMStateMachineStarter
      {
        namespace State
        {
            class Alt_Test_State: public CLState
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
                    Alt_Test_State(const char *name = "Alt_Test_State");
                    virtual ~Alt_Test_State();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Alt_Test_State_Variables.h"
            };
        }
      }
    }
}

#endif
