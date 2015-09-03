//
// State_End.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_CLReflectDemo_State_End_h
#define clfsm_CLReflectDemo_State_End_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMCLReflectDemo
      {
        namespace State
        {
            class End: public CLState
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
                    End(const char *name = "End");
                    virtual ~End();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_End_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
