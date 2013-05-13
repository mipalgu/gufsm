//
// State_Set.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_GameController_State_Set_h
#define clfsm_GameController_State_Set_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMGameController
      {
        namespace State
        {
            class Set: public CLState
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
                    Set(const char *name = "Set");
                    virtual ~Set();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Set_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
