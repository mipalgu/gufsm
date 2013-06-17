//
// State_KICK.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Color_Learner_State_KICK_h
#define clfsm_Color_Learner_State_KICK_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMColor_Learner
      {
        namespace State
        {
            class KICK: public CLState
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
                    KICK(const char *name = "KICK");
                    virtual ~KICK();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_KICK_Variables.h"
            };
        }
      }
    }
}

#endif
#pragma clang diagnostic pop
