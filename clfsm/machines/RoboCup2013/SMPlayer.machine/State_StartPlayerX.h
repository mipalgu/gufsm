//
// State_StartPlayerX.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMPlayer_State_StartPlayerX_h
#define clfsm_SMPlayer_State_StartPlayerX_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMPlayer
      {
        namespace State
        {
            class StartPlayerX: public CLState
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
                    StartPlayerX(const char *name = "StartPlayerX");
                    virtual ~StartPlayerX();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_StartPlayerX_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
