//
// State_TestStop.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SLAM_State_TestStop_h
#define clfsm_SLAM_State_TestStop_h

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
            class TestStop: public CLState
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
                    TestStop(const char *name = "TestStop");
                    virtual ~TestStop();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_TestStop_Variables.h"
#                   include "State_TestStop_Methods.h"
            };
        }
      }
    }
}

#endif
