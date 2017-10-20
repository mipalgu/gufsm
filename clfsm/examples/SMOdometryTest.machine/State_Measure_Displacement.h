//
// State_Measure_Displacement.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SMOdometryTest_State_Measure_Displacement_h
#define clfsm_SMOdometryTest_State_Measure_Displacement_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMOdometryTest
      {
        namespace State
        {
            class Measure_Displacement: public CLState
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
                    Measure_Displacement(const char *name = "Measure_Displacement");
                    virtual ~Measure_Displacement();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Measure_Displacement_Variables.h"
#                   include "State_Measure_Displacement_Methods.h"
            };
        }
      }
    }
}

#endif
