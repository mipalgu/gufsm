//
// State_State_3.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SLAM_State_State_3_h
#define clfsm_SLAM_State_State_3_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSLAM
      {
        namespace State
        {
            class State_3: public CLState
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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wzero-length-array"
                CLTransition *_transitions[0];
#pragma clang diagnostic pop


                public:
                    State_3(const char *name = "State_3");
                    virtual ~State_3();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_State_3_Variables.h"
#                   include "State_State_3_Methods.h"
            };
        }
      }
    }
}

#endif
