//
// State_SONAR_VALUES.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_BatNao_State_SONAR_VALUES_h
#define clfsm_BatNao_State_SONAR_VALUES_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMBatNao
      {
        namespace State
        {
            class SONAR_VALUES: public CLState
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
                    SONAR_VALUES(const char *name = "SONAR_VALUES");
                    virtual ~SONAR_VALUES();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_SONAR_VALUES_Variables.h"
            };
        }
      }
    }
}

#endif
