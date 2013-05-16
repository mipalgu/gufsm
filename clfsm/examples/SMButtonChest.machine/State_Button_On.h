//
// State_Button_On.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMButtonChest_State_Button_On_h
#define clfsm_SMButtonChest_State_Button_On_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMButtonChest
      {
        namespace State
        {
            class Button_On: public CLState
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
                    Button_On(const char *name = "Button_On");
                    virtual ~Button_On();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Button_On_Variables.h"
            };
        }
      }
    }
}

#endif
