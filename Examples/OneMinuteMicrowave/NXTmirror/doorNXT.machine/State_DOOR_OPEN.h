//
// State_DOOR_OPEN.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_doorNXT_State_DOOR_OPEN_h
#define clfsm_doorNXT_State_DOOR_OPEN_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMdoorNXT
      {
        namespace State
        {
            class DOOR_OPEN: public CLState
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
                    DOOR_OPEN(const char *name = "DOOR_OPEN");
                    virtual ~DOOR_OPEN();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_DOOR_OPEN_Variables.h"
            };
        }
      }
    }
}

#endif
