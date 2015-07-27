//
// State_Exit.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_MultiMachine_State_Exit_h
#define clfsm_MultiMachine_State_Exit_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMMultiMachine
      {
        namespace State
        {
            class Exit: public CLState
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
                    Exit(const char *name = "Exit");
                    virtual ~Exit();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Exit_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
