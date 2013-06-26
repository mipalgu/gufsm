//
// State_rightVisible.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMReadyFromAnywhere_State_rightVisible_h
#define clfsm_SMReadyFromAnywhere_State_rightVisible_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMReadyFromAnywhere
      {
        namespace State
        {
            class rightVisible: public CLState
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

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 14): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    rightVisible(const char *name = "rightVisible");
                    virtual ~rightVisible();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_rightVisible_Variables.h"
            };
        }
      }
    }
}

#endif
