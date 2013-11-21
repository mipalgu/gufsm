//
// State_Long_Press.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMButtonRightFoot_State_Long_Press_h
#define clfsm_SMButtonRightFoot_State_Long_Press_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMButtonRightFoot
      {
        namespace State
        {
            class Long_Press: public CLState
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
                    Transition_0(int toState = 2): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Long_Press(const char *name = "Long_Press");
                    virtual ~Long_Press();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Long_Press_Variables.h"
            };
        }
      }
    }
}

#endif
