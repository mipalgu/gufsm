//
// State_Three.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_RandomDispatcher_State_Three_h
#define clfsm_RandomDispatcher_State_Three_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMRandomDispatcher
      {
        namespace State
        {
            class Three: public CLState
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
                    Transition_0(int toState = 0): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };


                CLTransition *_transitions[1];

                public:
                    Three(const char *name = "Three");
                    virtual ~Three();

                    virtual CLTransition * const *transitions() const {
                        return _transitions;
                    }

                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Three_Variables.h"
            };
        }
      }
    }
}

#endif
