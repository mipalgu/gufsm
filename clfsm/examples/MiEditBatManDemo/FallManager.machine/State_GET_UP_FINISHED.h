//
// State_GET_UP_FINISHED.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_FallManager_State_GET_UP_FINISHED_h
#define clfsm_FallManager_State_GET_UP_FINISHED_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMFallManager
      {
        namespace State
        {
            class GET_UP_FINISHED: public CLState
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
                    Transition_0(int toState = 2): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    GET_UP_FINISHED(const char *name = "GET_UP_FINISHED");
                    virtual ~GET_UP_FINISHED();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_GET_UP_FINISHED_Variables.h"
            };
        }
      }
    }
}

#endif
