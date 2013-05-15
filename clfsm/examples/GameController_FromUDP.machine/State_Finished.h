//
// State_Finished.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_GameController_FromUDP_State_Finished_h
#define clfsm_GameController_FromUDP_State_Finished_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMGameController_FromUDP
      {
        namespace State
        {
            class Finished: public CLState
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
                    Transition_0(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Finished(const char *name = "Finished");
                    virtual ~Finished();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Finished_Variables.h"
            };
        }
      }
    }
}

#endif
