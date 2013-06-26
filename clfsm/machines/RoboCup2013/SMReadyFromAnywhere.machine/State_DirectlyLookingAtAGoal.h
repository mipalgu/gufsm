//
// State_DirectlyLookingAtAGoal.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMReadyFromAnywhere_State_DirectlyLookingAtAGoal_h
#define clfsm_SMReadyFromAnywhere_State_DirectlyLookingAtAGoal_h

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
            class DirectlyLookingAtAGoal: public CLState
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
                    DirectlyLookingAtAGoal(const char *name = "DirectlyLookingAtAGoal");
                    virtual ~DirectlyLookingAtAGoal();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_DirectlyLookingAtAGoal_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
