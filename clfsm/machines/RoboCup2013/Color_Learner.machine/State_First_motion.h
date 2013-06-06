//
// State_First_motion.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Color_Learner_State_First_motion_h
#define clfsm_Color_Learner_State_First_motion_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMColor_Learner
      {
        namespace State
        {
            class First_motion: public CLState
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
                    First_motion(const char *name = "First_motion");
                    virtual ~First_motion();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_First_motion_Variables.h"
            };
        }
      }
    }
}

#endif
