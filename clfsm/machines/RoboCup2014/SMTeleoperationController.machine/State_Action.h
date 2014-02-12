//
// State_Action.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMTeleoperationController_State_Action_h
#define clfsm_SMTeleoperationController_State_Action_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMTeleoperationController
      {
        namespace State
        {
            class Action: public CLState
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
                    Action(const char *name = "Action");
                    virtual ~Action();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Action_Variables.h"
            };
        }
      }
    }
}

#endif
