//
// State_ResumeSensing.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SMFallManager_State_ResumeSensing_h
#define clfsm_SMFallManager_State_ResumeSensing_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSMFallManager
      {
        namespace State
        {
            class ResumeSensing: public CLState
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

                class Transition_0: public CLTransition
                {
                public:
                    Transition_0(int toState = 4): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    ResumeSensing(const char *name = "ResumeSensing");
                    virtual ~ResumeSensing();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_ResumeSensing_Variables.h"
            };
        }
      }
    }
}

#endif
