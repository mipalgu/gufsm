//
// State_Restart_Self.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_ControlExample_State_Restart_Self_h
#define clfsm_ControlExample_State_Restart_Self_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMControlExample
      {
        namespace State
        {
            class Restart_Self: public CLState
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
                    Restart_Self(const char *name = "Restart_Self");
                    virtual ~Restart_Self();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Restart_Self_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
