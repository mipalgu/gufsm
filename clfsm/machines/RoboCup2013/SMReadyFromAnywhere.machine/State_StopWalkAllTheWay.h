//
// State_StopWalkAllTheWay.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMReadyFromAnywhere_State_StopWalkAllTheWay_h
#define clfsm_SMReadyFromAnywhere_State_StopWalkAllTheWay_h

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
            class StopWalkAllTheWay: public CLState
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

                public:
                    StopWalkAllTheWay(const char *name = "StopWalkAllTheWay");
                    virtual ~StopWalkAllTheWay();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_StopWalkAllTheWay_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
