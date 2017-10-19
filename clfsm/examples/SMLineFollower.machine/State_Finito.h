//
// State_Finito.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SMLineFollower_State_Finito_h
#define clfsm_SMLineFollower_State_Finito_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMLineFollower
      {
        namespace State
        {
            class Finito: public CLState
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
                    Finito(const char *name = "Finito");
                    virtual ~Finito();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Finito_Variables.h"
#                   include "State_Finito_Methods.h"
            };
        }
      }
    }
}

#endif
